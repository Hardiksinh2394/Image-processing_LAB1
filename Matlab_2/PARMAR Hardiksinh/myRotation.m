function [O] = myRotation(I, angle, method)

%   Input
%       I       - Input Image
%       angle   - Angle of Rotation
%       method  - Interpolation method {"nearest", "bilinear"}

%   Output
%       O - Rotated Image

%% Function starts from here

I = im2double(I);

theta=(angle)*pi/360; % Angle of Rotation

[r, c] = size(I); % Size of the Image

O = zeros(size(r,c));

midx = r./2; % Midpoint of x-axis
midy = c./2; % Midpoint of y-axis

for i=1:r
    for j=1:c
        
        % Rotation steps
        x=(i-midx)*cos(theta)-(j-midy)*sin(theta);
        y=(i-midx)*sin(theta)+(j-midy)*cos(theta);
        x1=round(x)+midx;
        y1=round(y)+midy;
        
        % Interpolation steps
        if (1 <= x1 && x1 <= r && 1 <= y1 && y1 <=c)
            up = floor(x1);
            down = up+1;
            left = floor(y1);
            right = left+1;
            switch method 
                case 'nearest' % Nearest Neighbour Interpolation
                    
                    if (down <= r && right <= c)
                        intensity_1 =  I(up, left);
                        intensity_2 =  I(down, left);
                        intensity_3 =  I(up, right);
                        intensity_4 =  I(down, right);
                        intensity = (intensity_1 + intensity_2 + intensity_3 + intensity_4)/4;
                    end
                    
                case 'bilinear' % Bilinear Interpolation
                    
                    if (down <= r && right <= c)
                        intensity_1 =  I(up, left);
                        intensity_2 =  I(down, left);
                        leftIntensity = (x1-up) * (intensity_2 - intensity_1) + intensity_1;
                        intensity_3 =  I(up, right);
                        intensity_4 =  I(down, right);
                        rightIntensity = (x1-up) * (intensity_4 - intensity_3) + intensity_3;
                        intensity = (y1 - left) * (rightIntensity - leftIntensity) + leftIntensity;
                    end
            end
        else
            intensity = 0; % input image appears black
        end
        O(i,j)=intensity; % Store the output image 
    end
end

% Result
figure,
subplot(1,2,1),imshow(I), title('Original Image');
subplot(1,2,2),imshow(O), title('Rotated Image');

end

