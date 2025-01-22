% Step c: Enhance the image if necessary
switch issue
    case 'dark'
        enhanced_img = imadjust(gray_img, stretchlim(gray_img), []);
    case 'bright'
        enhanced_img = imadjust(gray_img, stretchlim(gray_img), []);
    case 'low_contrast'
        enhanced_img = imadjust(gray_img);
    otherwise
        enhanced_img = gray_img;
end

% Display the final enhanced image
figure;
imshow(enhanced_img);
title('Enhanced Image');
