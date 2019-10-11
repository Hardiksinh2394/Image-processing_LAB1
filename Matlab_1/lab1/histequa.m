function [E] = histequa(I)
%% 
% function for Histogram stretching %
% I = input any img ex; imread ('spine.tif')
% run the function ex: histequa('spine.tif')

%%
numofpixels = size(I,1)* size(I,2);  %read the size of the image 
figure, imshow(I);
title('Original Image');
E = uint8(zeros(size(I,1),size(I,2)));
f = zeros(256,1);
pf = zeros(256,1);
cum = zeros(256,1);
output = zeros(256,1);
n = 1:256;

for i = 1:size(I,1)
    for j = 1:size(I,2)
        value = I(i,j);
        f(value+1) = f(value+1)+1;  % counting number of each intensity level
        pf(value+1) = f(value+1)/numofpixels; % probability density function
    end
end
sum=0;
no_bins=255;
%The cumulative distribution probability is calculated. 
for i=1:size(pf)
   sum=sum+f(i);
   cum(i)=sum;
   pf(i)=cum(i)/numofpixels;
   output(i)=round(pf(i)*no_bins); % cdf total intensity value 
end

for i=1:size(I,1)
    for j=1:size(I,2)
            E(i,j)=output(I(i,j)+1);
    end
end
figure , imshow(E); title('Histogram equalization')
figure , imhist(E); title('Histogram of img')
end