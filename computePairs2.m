function pairSet = computePairs(vertices,faces,threshold)

    vertexPairs = [];
    vRing = compute_vertex_ring(faces);
    pairSet = cell(length(vRing),1);
    for index = 1:length(vRing)
        currNeighbours = vRing{index};
        
        for vertIndex = index:size(vertices,2)
            dist = norm(vertices(:,index) - vertices(:,vertIndex));
            if dist <= threshold
                currNeighbours = [currNeighbours vertIndex];
            end
        end
        
        currNeighbours = unique(currNeighbours);
        currNeighbours = currNeighbours(currNeighbours~=index);
        vertexPairs = [];
        for n = 1:length(currNeighbours)
            vertexPairs = [vertexPairs; [index currNeighbours(n)]];
        end
        pairSet{index} = vertexPairs;
    end
    
end