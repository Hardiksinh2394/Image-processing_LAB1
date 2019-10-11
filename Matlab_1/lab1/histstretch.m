% function for Histogram stretching %
% I = input any img ex; imread ('spine.tif')
% run the function ex: histstretch('spine.tif')

%%
function [s] = histstretch(img1)


img1 = im2double(img1);  % convert image into double format
[r,c]=size(img1);
a=min(img1(:));  % minimum intensity of the image
b=max(img1(:));  % maximum intensity of the image
s=zeros(r,c);

for i=1:r
    for j=1:c
        if img1(i,j)<a
            s(i,j)=0;
        elseif img1(i,j)>b
            s(i,j)=255;
            else
              s(i,j)= 255*(img1(i,j)-a)/(b-a); % implimentaion of the equation
            end
     end
end

subplot(2,2,1), imshow(img1); title ('original img')
subplot(2,2,2), imshow(uint8(s)); title ('histogramstretching img')
subplot(2,2,3), imhist(img1);  title ('before')
subplot(2,2,4),  imhist(uint8(s)); title ('after')
end

