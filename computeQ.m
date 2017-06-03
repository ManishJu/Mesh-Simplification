function Q = computeQ(vertex,faces,vertices)

    Q = zeros(4,4);
    vRingFaces = compute_vertex_face_ring(faces);
    currFace = vRingFaces{vertex};
    for index = 1:length(currFace)
        currVertices =(faces(:,currFace(index)))';
        Kp = computeKp(vertices(:,currVertices(1)),vertices(:,currVertices(2)),vertices(:,currVertices(3)));
        Q = Q + Kp;
    end

end