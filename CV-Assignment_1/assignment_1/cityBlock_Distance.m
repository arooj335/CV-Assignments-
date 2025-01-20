Cx = 50;            % Center X-coordinate
Cy = 50;            % Center Y-coordinate
radius = 20;        % Radius for the city block distance

A = zeros(100, 100); % Create a 100x100 matrix of zeros

for i = 1:1:100
    for j = 1:1:100
        % Apply the city block (Manhattan) distance condition
        if abs(Cx - i) + abs(Cy - j) <= radius
            A(i, j) = 255; % Set pixel to white if within the "radius"
        end
    end
end

A = uint8(A); % Convert the matrix to uint8 type
imshow(A);    % Display the resulting matrix
