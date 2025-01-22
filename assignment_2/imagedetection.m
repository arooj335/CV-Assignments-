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

% Step b: Analyze the histogram and detect issues
if size(img, 3) == 3
    % Convert RGB image to grayscale for analysis
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Display the histogram of the grayscale image
figure;
histogram(gray_img);
title('Histogram of Grayscale Image');

% Calculate the mean and standard deviation for contrast assessment
mean_intensity = mean(gray_img(:));
std_intensity = std(double(gray_img(:)));

% Thresholds for determining image quality
if mean_intensity < 50
    disp('The image is over dark.');
    issue = 'dark';
elif mean_intensity > 200
    disp('The image is over bright.');
    issue = 'bright';
elif std_intensity < 30
    disp('The image has low contrast.');
    issue = 'low_contrast';
else
    disp('The image has normal brightness and contrast.');
    issue = 'none';
end

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
