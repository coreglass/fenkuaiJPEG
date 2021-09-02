function [dwt_image] = dwt(image)
Y = image;
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
            H1(u, v) = 1 / (1 + (400 / D1)^4); %2阶巴特沃斯高通滤波器，截至频率为500
        end
        
    end
    
end

F1 = H1 .* a;
F1 = ifftshift(F1);
dwt_image = abs(ifft2(F1));

imwrite(I2,strcat(strcat(save_path,"0_"),image_name));
end



