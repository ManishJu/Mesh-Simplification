function vertexTriads = computeTriads(vertices,faces,threshold,pairs)

    vertexTriads = faces';
    newFaces = [];
    
    for index = 1:size(pairs,1)
        v1 = pairs(index,1);
        v2 = pairs(index,2);
        for vertIndex = 1:size(vertices,2)
            v3 = vertIndex;
            dist1 = norm(vertices(:,v1) - vertices(:,v3));
            dist2 = norm(vertices(:,v2) - vertices(:,v3));
            if dist1 <= threshold && dist2 <= threshold
                newFaces = [newFaces; [v1 v2 v3]];
            end
        end
    end
    vertexTriads = [vertexTriads; newFaces];
    vertexTriads = unique(vertexTriads,'rows');
end