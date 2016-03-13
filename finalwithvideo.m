videoFReader = vision.VideoFileReader('video5.wmv');
videoPlayer = vision.VideoPlayer;
while ~isDone(videoFReader)
  videoFrame = step(videoFReader);
  step(videoPlayer, videoFrame);
  %imshow(videoFrame)
  
  %clear all;
I= videoFrame;
subplot(3,1,1),imshow(I);

%FaceDetect = vision.CascadeObjectDetector();
%BBF=step(FaceDetect,I);
%I=imcrop(I,BBF);

EyeDetect = vision.CascadeObjectDetector('EyePairBig');
BB=step(EyeDetect,I);
nbb=numel(BB);
if nbb==4
I2=imcrop(I,BB);
pic_rgb=rgb2gray(I2);
ca=im2bw(pic_rgb,0.12);
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
   if n1>1000
       disp('Eye is open')
       title('Eye is open')
   else
       disp('Eye is closed')
       title('Eye is closed')
   end
  
 % pause(.01)
end
end
release(videoPlayer);
release(videoFReader);