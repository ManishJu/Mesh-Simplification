function vertexPairs = computePairs(vertices,faces,threshold)

    vertexPairs = [];
    vRing = compute_vertex_ring(faces);
    for index = 1:length(vRing)
        currNeighbours = vRing{index};
        for vertIndex = 1:size(vertices,2)
            dist = norm(vertices(:,index) - vertices(:,vertIndex));
            if dist <= threshold
                currNeighbours = [currNeighbours vertIndex];
            end
        end
        currNeighbours = unique(currNeighbours);
        currNeighbours = currNeighbours(currNeighbours~=index);
        for n = 1:length(currNeighbours)
            vertexPairs = [vertexPairs; [index currNeighbours(n)]];
        end
    end
    
end