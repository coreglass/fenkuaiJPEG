<<<<<<< HEAD
function [hist_image] = hisEqulColor2(image_path)
img=imread(image_path);
% thresh = rgb2gray(img);     %自动确定二值化阈值
% I2 = imbinarize(thresh,0.05); 
r=double(img);
g=double(img);
b=double(img);
img=cat(3,r,g,b);
hsvImg = rgb2hsv(img);  
V=hsvImg(:,:,3);  
[height,width]=size(V);  
  
V = uint8(V*255);  
NumPixel = zeros(1,256);  
for i = 1:height  
    for j = 1: width  
    NumPixel(V(i,j) + 1) = NumPixel(V(i,j) + 1) + 1;  
    end  
end  
  
  
ProbPixel = zeros(1,256);  
for i = 1:256  
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);  
end  
  
CumuPixel = cumsum(ProbPixel);  
CumuPixel = uint8(255 .* CumuPixel + 0.5);  
  
for i = 1:height  
    for j = 1: width  
        if V(i,j)==0
            V(i,j)=2;
        end
        V(i,j) = CumuPixel(V(i,j));  
    end  
end  
   
V = im2double(V);  
hsvImg(:,:,3) = V;  
hist_image = hsv2rgb(hsvImg); 

=======
function [hist_image] = hisEqulColor2(image_path)
img=imread(image_path);
% thresh = rgb2gray(img);     %自动确定二值化阈值
% I2 = imbinarize(thresh,0.05); 
r=double(img);
g=double(img);
b=double(img);
img=cat(3,r,g,b);
hsvImg = rgb2hsv(img);  
V=hsvImg(:,:,3);  
[height,width]=size(V);  
  
V = uint8(V*255);  
NumPixel = zeros(1,256);  
for i = 1:height  
    for j = 1: width  
    NumPixel(V(i,j) + 1) = NumPixel(V(i,j) + 1) + 1;  
    end  
end  
  
  
ProbPixel = zeros(1,256);  
for i = 1:256  
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);  
end  
  
CumuPixel = cumsum(ProbPixel);  
CumuPixel = uint8(255 .* CumuPixel + 0.5);  
  
for i = 1:height  
    for j = 1: width  
        if V(i,j)==0
            V(i,j)=2;
        end
        V(i,j) = CumuPixel(V(i,j));  
    end  
end  
   
V = im2double(V);  
hsvImg(:,:,3) = V;  
hist_image = hsv2rgb(hsvImg); 

>>>>>>> 8616116aedaa6bdbb3c691c92d9bd8ce141bff0e
