function  [newFaces,newVertices] = simplifyMeshTri(newFaces,newVertices,threshold)  

    %Compute pair sets separated by vertices
    pairSet = computePairs(newVertices,newFaces,threshold);
    triadSet = computeTriads(newVertices,newFaces,threshold,pairSet);

    %Compute Q for all Vertices
    Q = zeros(4,4,length(newVertices));
    for index = 1:length(newVertices)
        Q(:,:,index) = computeQ(index,newFaces,newVertices);
    end

    sortingList = zeros(size(triadSet,1),7);

    %compute error for each triad
    for sIndex = 1:length(triadSet)
        currentTriads = triadSet(sIndex,:);
        
        if ~isempty(currentTriads)        
            [error,vBar] = computeErrorTri(Q,newVertices,currentTriads(1),currentTriads(2),currentTriads(3));
            sortingList(sIndex,1:3) = currentTriads;
            sortingList(sIndex,4) = error;
            sortingList(sIndex,5:7) = vBar;
        end

    end
    sortingList = sortrows(sortingList,4);
    [newFaces,newVertices] = updateValuesTri(newFaces,newVertices,sortingList(1,5:7),sortingList(1,1),sortingList(1,2),sortingList(1,3));
    
end