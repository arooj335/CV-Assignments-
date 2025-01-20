A = zeros(100, 100); % Create a 100x100 matrix of zeros
Cx = 50;             % Center X-coordinate
Cy = 50;             % Center Y-coordinate
radius = 20;         % Radius of the circle

for i = 1:1:100
    for j = 1:1:100
        % Correct the condition for the circle
        if (Cx - i)^2 + (Cy - j)^2 <= radius^2
            A(i, j) = 255; % Set pixel value to 255
        end
    end
end

imshow(A); % Display the resulting matrix
