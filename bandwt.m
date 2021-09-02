
clc;
clear;
% 装载图像
file_path = '';% 图像文件夹路径 
save_path = "F:\coding\train_dwt\train\ae\";
img_path_list = dir(strcat(file_path,'*.png'));%获取该文件夹中所有png格式的图像  
img_num = length(img_path_list);%获取图像总数量 
I=cell(1,img_num);
if img_num > 0 %有满足条件的图像  
    for j = 1:img_num %逐一读取图像  
        image_name = img_path_list(j).name;% 图像名  
        Y = imread(strcat(file_path,image_name)); 
        f = rgb2gray(Y); %将rgb图像转换成灰度图像
        [M, N] = size(f);
        a = fft2(f);
        a = fftshift(a);
        m1 = fix(M / 2); n1 = fix(N / 2);
        for u = 1:M
            for v = 1:N
                D1 = sqrt((u - m1)^2 + (v - n1)^2);
                if D1 == 0
                    H1(u, v) = 0;
                else
                    %    H(u,v)=1/(1+0.414*(500/D1)^4);%截至频率为500
                    H1(u, v) = 1 / (1 + (500 / D1)^4); %2阶巴特沃斯高通滤波器，截至频率为500
                end

            end

        end

        F1 = H1 .* a;
        F1 = ifftshift(F1);
        I2 = abs(ifft2(F1));
        imwrite(I2,strcat(strcat(save_path,"0_"),image_name));
    end
end



