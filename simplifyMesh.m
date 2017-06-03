function  [newFaces,newVertices] = simplifyMesh(newFaces,newVertices,threshold)  

    %Compute pair sets separated by vertices
    pairSet = computePairs(newVertices,newFaces,threshold);

    %Compute Q for all Vertices
    Q = zeros(4,4,length(newVertices));
    for index = 1:length(newVertices)
        Q(:,:,index) = computeQ(index,newFaces,newVertices);
    end

    sortingList = zeros(size(pairSet,1),6);

    %compute error for each pair
    for sIndex = 1:length(pairSet)
        currentPairs = pairSet(sIndex,:);

        if ~isempty(currentPairs)        
            [error,vBar] = computeError(Q,newVertices,currentPairs(1),currentPairs(2));
            sortingList(sIndex,1:2) = currentPairs;
            sortingList(sIndex,3) = error;
            sortingList(sIndex,4:6) = vBar;
        end

    end
    sortingList = sortrows(sortingList,3);
    [newFaces,newVertices] = updateValues(newFaces,newVertices,sortingList(1,4:6),sortingList(1,1),sortingList(1,2));
    
end