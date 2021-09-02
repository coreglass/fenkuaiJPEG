<<<<<<< HEAD
%% 读取待处理的图像
clc 
clear
image1 = "3587-airplane.png";
image2 = "airplane_4_195_frog_390.png";
Q=100;

%% 使用自适应直方图均衡化增强扰动信息
hist_image1 = hisEqulColor2(image1);
hist_image2 = hisEqulColor2(image2);
imwrite(hist_image1,strcat("hist1_",image1));
imwrite(hist_image2,strcat("hist2_",image2));
              
%% 使用巴特沃斯滤波器提取高频信息
btws_image1 = btws(strcat("hist1_",image1),Q);
btws_image2 = btws(strcat("hist2_",image2),Q);




% 

subplot(2,4,1)
imshow(image1);
title("原始图像");

subplot(2,4,2)
imshow(image2);
title("对抗样本");

subplot(2,4,3)
imshow(hist_image1);
title("原始图像直方图均衡化");

subplot(2,4,4)
imshow(hist_image2);
title("对抗样本直方图均衡化");

subplot(2,4,5)
imshow(btws_image1*100);
title("原始图像-hist-BW高通滤波（放大100倍）");

subplot(2,4,6)
imshow(btws_image2*100);
title("对抗样本-hist-BW高通滤波（放大100倍）");

% subplot(2,4,7)
% imshow(btws_hist_image2*100);
% title("原始图像-hist-BW高通滤波（放大10倍）");
% 
% subplot(2,4,8)
% imshow(btws_hist_image2*100);
=======
%% 读取待处理的图像
clc 
clear
image1 = "3587-airplane.png";
image2 = "airplane_4_195_frog_390.png";
Q=100;

%% 使用自适应直方图均衡化增强扰动信息
hist_image1 = hisEqulColor2(image1);
hist_image2 = hisEqulColor2(image2);
imwrite(hist_image1,strcat("hist1_",image1));
imwrite(hist_image2,strcat("hist2_",image2));
              
%% 使用巴特沃斯滤波器提取高频信息
btws_image1 = btws(strcat("hist1_",image1),Q);
btws_image2 = btws(strcat("hist2_",image2),Q);




% 

subplot(2,4,1)
imshow(image1);
title("原始图像");

subplot(2,4,2)
imshow(image2);
title("对抗样本");

subplot(2,4,3)
imshow(hist_image1);
title("原始图像直方图均衡化");

subplot(2,4,4)
imshow(hist_image2);
title("对抗样本直方图均衡化");

subplot(2,4,5)
imshow(btws_image1*100);
title("原始图像-hist-BW高通滤波（放大100倍）");

subplot(2,4,6)
imshow(btws_image2*100);
title("对抗样本-hist-BW高通滤波（放大100倍）");

% subplot(2,4,7)
% imshow(btws_hist_image2*100);
% title("原始图像-hist-BW高通滤波（放大10倍）");
% 
% subplot(2,4,8)
% imshow(btws_hist_image2*100);
>>>>>>> 8616116aedaa6bdbb3c691c92d9bd8ce141bff0e
% title("对抗样本-hist-BW高通滤波（放大10倍）");