
%% Exercise 1
I = imread('lena.png');

dft2 = fft2(I);
dft2 = fftshift(dft2);
dft2min = min(min(abs(dft2)));
dft2max = max(max(abs(dft2)));


figure;
subplot(2,2,1); 
imshow(I); title('original img')

subplot(2,2,2); 
imshow(abs(dft2),[]); title('abs of 2D FFT')

subplot(2,2,3); 
imshow(abs(dft2), [dft2min*1.5 , dft2max*0.001]);
title('clipped/scaled abs of 2D FFT')

subplot(2,2,4);
imshow(log(dft2)+1, []);
title('log transformed abs of 2D FFT')

%% Exercise 2.a


I1 = imread('lena.png');

f1=fftn(I1);
mag1=abs(f1);

phase1=angle(f1);

r1=(ifftn(mag1));
r2=ifftn(exp(1i*phase1));

figure,
subplot(2,2,1)
imshow(I1); title('original img')

subplot(2,2,2)
imshow(uint8(r1)); title('image reconstruction from magnitude only')

subplot(2,2,3)
imshow(I1);

subplot(2,2,4)
imshow(r2,[]); title('image reconstruction from phase only')

%% %% Exercise 2.b

     
 I1 = imread('lena.png');
 
 
F = fft2 (double(I1));
F_Mag = abs(F);
F_Phase = exp(1i*angle(F));
%reconstructionin
I_mag = real(ifft2(F_Mag))
I_phase = real(ifft2(F_Phase))

I2 = imread('barbara.png');

F2 = fft2 (double(I2));
F_Mag2 = abs(F2);
F_Phase2 = exp(1i*angle(F2));
%reconstructionin
I_mag2 = real(ifft2(F_Mag2));
I_phase2 = real(ifft2(F_Phase2));

% mixed of both

imgix1 = F_Mag .* F_Phase2;
imgmix1 = ifft2(imgix1);
imgix2 = F_Mag2 .* F_Phase;
imgmix2 = real(ifft2(imgix2));

figure
subplot(2,2,1)
imshow(I2) , title('original barbara')

subplot(2,2,2)
imshow(imgmix1, []) , title('img magnitude from lena, phase correct')


subplot(2,2,3)
imshow(I1) , title('original lena')


subplot(2,2,4)
imshow(imgmix2, []) , title('img magnitude from barbara, phase correct')

%% Exercise 3


% lp_hp_filter_image
%
% read in png image lena and size the image
f=imread('lena.png');
[M,N]=size(f);
% pad image for convolution
PQ=paddedsize(size(f));
% enter filter type and design parameters
D0=50; % cutoff frequency (range 0 to 250)
D0=input('value for cutoff frequency (range 0 to 250):');
ftype=input('filter type (gaussian, ideal, btw (butterworth)):','s');
if (ftype(1:3) == 'gau')
Hp=lpfilter('gaussian',PQ(1),PQ(2),D0);
elseif (ftype(1:3) == 'ide')
Hp=lpfilter('ideal',PQ(1),PQ(2),D0);
elseif (ftype(1:3) == 'btw')
    n=input('butterworth filter order (1 to 6):');
Hp=lpfilter('btw',PQ(1),PQ(2),D0,n);
else	
error('improper filter type specified');
end
ilphp=input('lowpass (1) or highpass (0) filter:');
if (ilphp == 0) Hp=1-Hp;
end
% transform image to frequency domain using zero-padded image
Fp=fft2(f,PQ(1),PQ(2));
% display impulse response of lowpass filter using mesh plot
H=fftshift(Hp);
figure,mesh(H(1:10:PQ(1), 1:10:PQ(2)));
axis([0 round(PQ(1)/10) 0 round(PQ(2)/10) 0 1]);
% filter in frequency domain by multiplying 2-D FFTs
Gp=Hp.*Fp;
% convert back to image plane, using real value of inverse transform
gp=real(ifft2(Gp));
% crop image to original size and display uncropped and cropped image
gpc=gp(1:size(f,1),1:size(f,2));
figure,imshow(gp,[ ]);
figure,imshow(gpc,[ ]);

%% Exercise 4


