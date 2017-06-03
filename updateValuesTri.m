function [newFaces,newVertices] = updateValuesTri(faces,vertices,vBar,v1,v2,v3)

    vertices(:,v1) = vBar';
    vertices(:,v2) = vBar';
    vertices(:,v3) = vBar';
    
    columns1 = findCols(faces,v1);
    columns2 = findCols(faces,v2);
    columns3 = findCols(faces,v3);
    columns12 = intersect(columns1,columns2);
    columns23 = intersect(columns2,columns3);
    columns31 = intersect(columns3,columns1);
    columns123 = intersect(columns12,columns3);
    columns4 = unique(horzcat(columns12,columns23,columns31,columns123));
    faces(:,columns4) = [];
    
    faces(faces == v2) = v1;
    faces(faces == v3) = v1;
    
    if v2 > v3
        vertices(:,v2) = [];
        faces(faces>v2) = faces(faces>v2) - 1;
        vertices(:,v3) = [];
        faces(faces>v3) = faces(faces>v3) - 1;
    else
        vertices(:,v3) = [];
        faces(faces>v3) = faces(faces>v3) - 1;
        vertices(:,v2) = [];
        faces(faces>v2) = faces(faces>v2) - 1;
    end
    newVertices = vertices;
    newFaces = faces;

end