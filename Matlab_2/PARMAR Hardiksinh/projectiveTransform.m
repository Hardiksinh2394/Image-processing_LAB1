function [Projected_image] = projectiveTransform(I , ref)

%   Input
%       I - Input image 
%       R - Reference image

%   Output
%       O - Output Image 

%% Function starts from here

% coordinates of input and reference image
figure
imshow(I), title('Input Image');
[a,b] = ginput(4);

figure
imshow(ref), title('Reference Image');
[a1, b1] = ginput(4);

X = [a,b];
Y = [a1,b1];

% Projective Transformation 
T = fitgeotrans(X, Y, 'projective');

% Apply Transformation on the input image
Projected_image = imwarp(I, T);
figure, imshow(Projected_image), title('Projective Transformation');

% Crop the Transformed image
[~ , rect] = imcrop(Projected_image);
Img_crop = imcrop(Projected_image, rect);
figure, imshow(Img_crop), title('Croped Image (After Transformation)');

end

