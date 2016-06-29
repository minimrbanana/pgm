function simg = shiftimg(img, offset, fillValue)
% SHIFTIMG Translates img by offset shift, cropping the result to the original size. 
% The empty space will be filled with fillValue. Use 0 for sum-product and 10^10 for min-sum (not Inf)!!
    [kr,kc] = size(img);
    
    T = [1 0 0; 0 1 0; offset(1) offset(2) 1];
    tform = maketform('affine', T);        
    simg = imtransform(img,tform,'nearest','XData',[1 kc],'YData',[1 kr],'FillValues',fillValue);        
end

