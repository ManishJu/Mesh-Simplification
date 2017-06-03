function [error,vBar] = computeError(Q,vertices,vertex1,vertex2)
    
    threshold = 1000;
    v1 = vertices(:,vertex1);
    v2 = vertices(:,vertex2);
    Q1 = Q(:,:,vertex1);
    Q2 = Q(:,:,vertex2);
    Qt = Q1 + Q2;
    Qm = Qt;
    Qm(4,:) = [0 0 0 1];
    
    
    if(cond(Qm) > threshold)
        vBar = (v1(1:3) + v2(1:3)) / 2;
        vBar(4) = 1;
    else
        vBar = Qm \ [0;0;0;1];
    end

    error = vBar' * Qt * vBar;
    vBar = vBar(1:3)';
    
end