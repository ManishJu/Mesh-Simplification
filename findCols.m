
function colNums = findCols(faces,val)

    faceSize = size(faces);
    colNums = [];
    for x = 1:faceSize(1)
        for y = 1:faceSize(2)
            if val == faces(x,y)
                colNums = [colNums y];
            end
        end
    end

end