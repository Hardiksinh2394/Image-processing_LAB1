%%
% Here i am reading both the images 
% run the program it will show the output of histogram streching and
% equalization


clc; clear all; close all;



im1 = imread('spine.tif');   % first image
im2 = imread('aerial.tif');   % second image 
img1 = imresize(im1,0.5);  % Here i am resize the image 
img2 = imresize(im2,0.5);
%figure();
%imshow(img1); title ('original img')
%figure();
%imshow(img2); title ('original img')
figure();
img1_histstrach = histstretch(img1); % ouput histogram stretching
figure();                               
img2_histstrach = histstretch(img2);
img1_hist_eq = histequa(img1);   % ouput histogram equalization
img2_hist_eq = histequa(img2);







