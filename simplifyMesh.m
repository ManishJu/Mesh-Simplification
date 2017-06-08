function  [newFaces,newVertices] = simplifyMesh(newFaces,newVertices,threshold)  

    %Compute pair sets separated by vertices
    pairSet = computePairs(newVertices,newFaces,threshold);

    %Compute Q for all Vertices
    Q = zeros(4,4,length(newVertices));
    parfor index = 1:length(newVertices)
        Q(:,:,index) = computeQ(index,newFaces,newVertices);
    end

    sortingList = zeros(size(pairSet,1),6);

    %compute error for each pair
    parfor sIndex = 1:length(pairSet)
        currentPairs = pairSet(sIndex,:);

        if ~isempty(currentPairs)        
            [error,vBar] = computeError(Q,newVertices,currentPairs(1),currentPairs(2));
             sortingList(sIndex,:) = horzcat(currentPairs(1),currentPairs(2),error,vBar);
        end

    end
    sortingList = sortrows(sortingList,3);
    [newFaces,newVertices] = updateValues(newFaces,newVertices,sortingList(1,4:6),sortingList(1,1),sortingList(1,2));
    
end