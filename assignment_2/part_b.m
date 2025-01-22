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