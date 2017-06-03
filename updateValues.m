function [newFaces,newVertices] = updateValues(faces,vertices,vBar,v1,v2)

    vertices(:,v1) = vBar';
    vertices(:,v2) = vBar';
    columns1 = findCols(faces,v1);
    columns2 = findCols(faces,v2);
    columns3 = intersect(columns1,columns2);
    faces(:, columns3) = [];
    faces(faces == v2) = v1;
    faces(faces > v2) = faces(faces > v2) - 1;
    vertices(:, v2) = [];
    newVertices = vertices;
    newFaces = faces;

end