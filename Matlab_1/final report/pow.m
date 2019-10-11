%%
% function for power law transformation 
% Here i am create images using power law transformation  

%%

b1 = imread('spine.tif'); % first image


 ib1=im2double(b1); % convert image into double format
[r,c]=size(ib1);
p1=ib1;
for i=1:r
    for j=1:c
         p1(i,j)=2*(ib1(i,j).^0.5); % here i put the gamma value <1 for the image
    end
end

subplot(2,2,1), imshow(b1); title('original img');
subplot(2,2,2), imshow(p1); title('final img'); 



b2 = imread('aerial.tif'); % second image

 ib2=im2double(b2);
[r,c]=size(ib2);
p2=ib2;
for i=1:r
    for j=1:c
         p2(i,j)=2*(ib2(i,j).^2.8); % here i put the gamma value >1 for the image
    end
end

subplot(2,2,3), imshow(b2); title('original img');
subplot(2,2,4), imshow(p2); title('final img');



