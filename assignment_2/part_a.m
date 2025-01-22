% Read an image 
img = imread('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTc00PZGEMrTZSPDzsPV4foq7LbB7m4xqL4zF8RE6-MYiCMUDG2');

% Display the original image
figure;
imshow(img);
title('Original Image');

% Step a: Determine the type of image
if islogical(img)
    disp('The image is binary.');
elif size(img, 3) == 1
    disp('The image is grayscale.');
else
    disp('The image is RGB.');
end