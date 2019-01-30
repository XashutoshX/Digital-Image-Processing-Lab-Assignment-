clc;
close all;
clear all;

img = double( rgb2gray(imread('lena_color.jpg')));
img11 = img(:);
Xk = unique(img11);% intensity levels in the image
img33 =sort(img11);
n=size(img,1)*size(img,2);
L_mat = zeros(512);
U_mat = zeros(512);


 Imean = mean2(img); 
 for i = 1:512
    for j = 1:512
        
        if img(i,j)<= Imean
            L_mat(i,j) = img(i,j);
        else
            U_mat(i,j) = img(i,j);
        end
   
    end
 end
 
L_img11 = L_mat(:);
L_img22 = unique(L_img11);
L_img33 = sort(L_img11);

U_img11 = U_mat(:);
U_img22 = unique(U_img11);
U_img33 = sort(U_img11);


 counts_L = [];
 for i = 1:115
     
    coL =  sum(L_img33(:)==L_img22(i));
    counts_L = [counts_L , coL];
 
 end
 
  Lp_mat = [];
  
 for i = 2: 115
     Lprob = counts_L(i)/(n-143107);
      Lp_mat =  [Lp_mat,Lprob];
 end
 
 Lcdf = cumsum(Lp_mat);
 FL_new = [];
for i =1:114
    L_val = 5 + (Imean-5)*Lcdf(i);
    FL_new = [FL_new,L_val];
end
L_img22([1],:) = [];
zL=[];
 zL = vertcat(L_img22',FL_new)';
  L_dummy = zeros(512);
 for i = 1:512
     for j = 1:512
         for k = 1:114
            if(L_mat(i,j)==zL(k,1))
                L_dummy(i,j)= zL(k,2);
            end 
         end
     end
 end
 
 
 
 %-----------------------------------------------
 
 counts_U = [];
 for i = 1:136
     
    coU =  sum(U_img33(:)==U_img22(i));
    counts_U = [counts_U , coU];
 
 end
 
   Up_mat = [];
   
  for i = 2: 136
      Uprob = counts_U(i)/(n-119037);
       Up_mat =  [Up_mat,Uprob];
  end
  
  Ucdf = cumsum(Up_mat);
  FU_new = [];
 for i =1:135
     U_val = 119 + (254-119)*Ucdf(i);
     FU_new = [FU_new,U_val];
 end
 U_img22([1],:) = [];
 zU=[];
  zU = vertcat(U_img22',FU_new)';
   U_dummy = zeros(512);
  for i = 1:512
      for j = 1:512
          for k = 1:135
             if(U_mat(i,j)==zU(k,1))
                 U_dummy(i,j)= zU(k,2);
             end 
          end
      end
  end
  
  final = L_dummy +U_dummy;
  
  
   for i = 2:115
      aL(i-1) = counts_L(i);
  end
  
  for i = 2:136
      aU(i-1) = counts_U(i);
  end
  subplot(2,4,2)
  imshow(uint8(final));
  title('Image after Bi-Histogram Equalization')
  ax = gca;
  ax.FontSize = 8;
  subplot(2,4,1)
  imshow(uint8(img));
  title("Original grayscale Image")
  ax = gca;
  ax.FontSize = 8;
  subplot(2,4,3);
  histogram(img);
  title("Histogram of original grayscale image")
  ax = gca;
  ax.FontSize = 8;
  subplot(2,4,4);
  histogram(final);
  title("Histogram of bi-histogram equalized image")
  ax = gca;
  ax.FontSize = 8;
  subplot(2,4,5);
  imshow(uint8(L_dummy));
  subplot(2,4,6);
  imshow(uint8(U_dummy));
  subplot(2,4,7);
  plot(L_img22,aL);
  subplot(2,4,8);
  plot(U_img22,aU);

  
  