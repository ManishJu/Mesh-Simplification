function Kp = computeKp(v1,v2,v3)

    va = v2 - v1;
    vb = v3 - v1;
    vc = cross(va,vb);
    d = - dot(v1,vc');
    a = vc(1);
    b = vc(2);
    c = vc(3);
    Kp = [a*a, a*b, a*c, a*d;
         a*b, b*b, b*c, b*d;
         c*a, c*b, c*c, c*d;
         d*a, d*b, d*c, d*d];
     
end