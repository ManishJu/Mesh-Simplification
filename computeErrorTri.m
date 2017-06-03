function [error,vBar] = computeErrorTri(Q,vertices,vertex1,vertex2,vertex3)
    
    threshold = 90000;
    v1 = vertices(:,vertex1);
    v2 = vertices(:,vertex2);
    v3 = vertices(:,vertex3);
    
    Q1 = Q(:,:,vertex1);
    Q2 = Q(:,:,vertex2);
    Q3 = Q(:,:,vertex3);
    
    Qt = Q1 + Q2 + Q3;
    Qm = Qt;
    Qm(4,:) = [0 0 0 1];
    
    % Checking for devide by zero
    if(cond(Qm) > threshold)
        vBar = (v1(1:3) + v2(1:3) + v3(1:3)) / 3;
        vBar(4) = 1;
    else
        vBar = Qm \ [0;0;0;1]; % this new collapsed center
    end

    error = vBar' * Qt * vBar;
    vBar = vBar(1:3)';
    
end