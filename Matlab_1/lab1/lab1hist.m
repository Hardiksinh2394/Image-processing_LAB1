img1 = imread('IA.bmp');
img2 = imread('IB.bmp');
img3 = imread('IC.bmp');
img4 = imread('ID.bmp');

figure
subplot(2,4,1);
imshow(img1);
subplot(2,4,2);
imhist(img1);
title(img1);



subplot(2,4,3);
imshow(img2);
subplot(2,4,4);
imhist(img2);
title(img2);


subplot(2,4,5);
imshow(img3);
subplot(2,4,6);
imhist(img3);
title(img3);


subplot(2,4,7);
imshow(img4);
subplot(2,4,8);
imhist(img4);
title(img4);


A1 = imhist(img1);
sum(A1(101:151))
A1min = min(img1(:))
A1max = max(img1(:))

A2 = imhist(img2);
sum(A2(101:151))
A2min = min(img2(:))
A2max = max(img2(:))

A3 = imhist(img3);
sum(A3(101:151))
A3min = min(img3(:))
A3max = max(img3(:))

A4 = imhist(img4);
sum(A4(101:151))
A4min = min(img4(:))
A4max = max(img4(:))


