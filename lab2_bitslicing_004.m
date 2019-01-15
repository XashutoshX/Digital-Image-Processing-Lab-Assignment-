%   Copyright (C) SYSCON Systems, Inc - All Rights Reserved
%   Unauthorized copying of this file, via any medium is strictly prohibited
%   Proprietary and confidential
%   Written by Ashutosh Joge <jogeashutosh@gmail.com> 15-01-2019

clc;clear all;close all;
%image pixel values are stored in variable img
img =rgb2gray( imread('lena_color.jpg'));

imgd = double(img);

% extracting bits from imgd variable

c1 = mod(imgd,2);
c2 = mod(floor(imgd/2),2);
c3 = mod(floor(imgd/4),2);
c4 = mod(floor(imgd/8),2);
c5 = mod(floor(imgd/16),2);
c6 = mod(floor(imgd/32),2);
c7 = mod(floor(imgd/64),2);
c8 = mod(floor(imgd/128),2);

%original image in grayscasle
subplot(2, 5, 1); 
imshow(img); 
title('Original Image'); 
  
% plotting binary image having extracted bit from 1st to 8th 
% in subplot from 2nd to 9th 
subplot(2, 5, 2); 
imshow(c1); 
title('Bit Plane 1'); 
subplot(2, 5, 3); 
imshow(c2); 
title('Bit Plane 2'); 
subplot(2, 5, 4); 
imshow(c3); 
title('Bit Plane 3'); 
subplot(2, 5, 5); 
imshow(c4); 
title('Bit Plane 4'); 
subplot(2, 5, 6); 
imshow(c5); 
title('Bit Plane 5'); 
subplot(2, 5, 7); 
imshow(c6); 
title('Bit Plane 6'); 
subplot(2, 5, 8); 
imshow(c7); 
title('Bit Plane 7'); 
subplot(2, 5, 9); 
imshow(c8); 
title('Bit Plane 8'); 