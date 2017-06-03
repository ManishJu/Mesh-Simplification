function ptCloud = addNoise(ptCloudInput,randomness)

xyz = ptCloudInput.Location;
XL = ptCloudInput.XLimits*randomness;
YL = ptCloudInput.YLimits*randomness;
ZL = ptCloudInput.ZLimits*randomness;

if randomness > 1 
    randomness = 1;
elseif randomness < 0
    randomness = 0;
end

for i=1:ptCloudInput.Count
xyz(i,1) =xyz(i,1) + my_rand(XL(1), XL(2));
xyz(i,2) =xyz(i,2) + my_rand(YL(1), YL(2));
xyz(i,3) =xyz(i,3) + my_rand(ZL(1), ZL(2));
end
ptCloud = pointCloud(xyz);
end

