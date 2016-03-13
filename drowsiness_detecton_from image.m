%Author:  Sayed hasnat  
%         EEE, Khulna University of Engineering & Technology, khulna, Bangladesh.
%        e-mail: sayedhasnat6[at]gmail[dot]com

clear all;
I= imread('closeeye1.jpg');
subplot(3,1,1),imshow(I);
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
BB=step(EyeDetect,I);
I2=imcrop(I,BB);
pic_rgb=rgb2gray(I2);
ca=im2bw(pic_rgb,0.15);
 c=~ca;
 se=strel('square',1);
   eye_dil=imdilate(c,se);
   d=imcrop(eye_dil,[110 105 110 33]); 
   subplot(3,1,2),imshow(I2);
   subplot(3,1,3),imshow(eye_dil);
    n=numel(eye_dil);
   n1=0;
   for i=1:n
       if eye_dil(i)==1
           n1=n1+1;
       end
   end
   n1
   if n1>10
       disp('Eye is open')
       title('Eye is open')
   else
       disp('Eye is closed')
       title('Eye is closed')
   end
