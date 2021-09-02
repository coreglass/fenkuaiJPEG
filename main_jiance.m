%% 读取待处理的图像
clc 
clear
image1 = "n01847000_10012.png";
image2 = "n01847000_1625135274.png";
Q=450;
X=10;
btws_image1 = btws(image1,Q);
btws_image2 = btws(image2,Q);

%% 使用自适应直方图均衡化增强扰动信息
hist_image1 = hisEqulColor2(image1);
hist_image2 = hisEqulColor2(image2);
imwrite(hist_image1,strcat("hist1_",image1));
imwrite(hist_image2,strcat("hist2_",image2));
btws_hist_image1 = btws(strcat("hist1_",image1),Q);
btws_hist_image2 = btws(strcat("hist2_",image2),Q);
%% 使用巴特沃斯滤波器提取高频信息
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
imshow(btws_image1*X);
title("原始图像-BW高通滤波（放大10倍）");

subplot(2,4,6)
imshow(btws_image2*X);
title("对抗样本-BW高通滤波（放大10倍）");

subplot(2,4,7)
imshow(btws_hist_image1*X);
title("原始图像-hist-BW高通滤波（放大10倍）");

subplot(2,4,8)
imshow(btws_hist_image2*X);
title("对抗样本-hist-BW高通滤波（放大10倍）");