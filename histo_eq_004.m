%   Copyright (C) SYSCON Systems, Inc - All Rights Reserved
%   Unauthorized copying of this file, via any medium is strictly prohibited
%   Proprietary and confidential
%   Written by Ashutosh Joge <jogeashutosh@gmail.com> 15-01-2019
%   IIIT Nagpur
clc;close all;clear all;

img = double( rgb2gray(imread('lena_color.jpg')));
%   img =rgb2gray(imread('lena_color.jpg'));
%nop = number of pixels for calculating probability
nop = size(img,1)*size(img,2);
img11 = img(:);
img22 = unique(img11)';
img33 =sort(img11);

edges = min(img33(:)) : max(img33(:));
% counts = histcounts(img33(:), edges);
% counts = (histcounts(img(:), img_intensity))';
counts = [];
%this for loop is used to calculate number of pixel intensities in matrix img
for i = 1:249
    
   co =  sum(img33(:)==img22(i));
   counts = [counts , co];

end 
 p_mat = [];
  
 for i = 1: 249
      prob = counts(i)/nop;
      p_mat =  [p_mat,prob];
  end
%  tab = vertcat(img22,counts,p_mat,cumsum(p_mat),30*cumsum(p_mat),floor(100*cumsum(p_mat)));
 
 cdf = cumsum(counts)';
 c_min = min(img(:));
 
 L = 256;
 hv = [];
 for i = 1: 249
     val = floor(((cdf(i)-c_min)/(nop - c_min))*(L-1));
      hv = [hv,val];
 end
 
  tab = vertcat(img22,counts,p_mat,cumsum(p_mat),hv);
  z = [] ;
  z = horzcat(img22',counts');
  dummy_img = zeros(512);
for i = 1:512
    for j = 1:512
        for k = 1:249
            if(img(i,j)==z(k,1))
                dummy_img(i,j)= z(k,2);
            end
        end
    end
end
  
for i =1:16
    subplot(4,4,i)
    imshow(uint8(dummy_img/i))
end