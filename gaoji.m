%-----------------Matlab基本图像处理函数使用------------------
clear ;
close all;
color_pic=imread('0-2.png');  %读取图像
figure('name','图像读取');   
subplot(2,2,1);
imshow(color_pic);   %显示图像
title('原彩色图像');
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
subplot(2,2,2);
imshow(gray_pic);
title('灰度图像');
subplot(2,2,3);
imhist(gray_pic);   %查看灰度直方图，默认n=256,256个长度为1的灰度空间
title('灰度直方图256等级');
subplot(2,2,4);
imhist(gray_pic,64);%n=64，64个长度为4的灰度空间
title('灰度直方图64等级');

%------------------傅里叶变换------------------
clear;  %清除变量
close all; %关闭生成的画图窗口
color_pic=imread('0-2.png');  %读取图像
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
figure('name','傅里叶变换'); %傅里叶变换
subplot(2,2,1);
imshow(gray_pic);
title('原灰度图像');
Fourier=fft2(gray_pic);  %对灰度图像进行傅里叶正变换
log_Fourier=log(abs(Fourier)+1); %取模并进行缩放，调高频谱图像的低灰度值而对高灰度值仅可能减小
subplot(2,2,2);
imshow(log_Fourier,[]);    %未进行频谱搬移时的频谱图
title('傅里叶变换频谱图');
Fourier_shift=fftshift(Fourier); %将频谱图中零频率成分移动至频谱图中心
log_Fourier_shift=log(abs(Fourier_shift)+1); %取模并进行缩放，对于（0，1）之间的x值经过取对数后会变成负值，而log（x+1）则将所有的x值映射到正数范围内
subplot(2,2,3);
imshow(log_Fourier_shift,[]);
title('频移后的频谱图');

%-----------------设置阈值滤除高频  傅里叶逆变换----------------
clear;
close all;
color_pic=imread('0-2.png');  %读取图像
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
threshold=[100000,30000,5000,500];  %设置不同阈值 (高频部分能量低)
figure('name','傅里叶逆变换图像');
for i=1:4
    Fourier=fft2(gray_pic);  %对灰度图像进行傅里叶正变换
    Fourier_shift=fftshift(Fourier); %将频谱图中零频率成分移动至频谱图中心
    h_Fourier_shift=abs(Fourier_shift);% 取傅里叶变换后幅度模值，使灰度值为正数
    Fourier_shift(h_Fourier_shift<threshold(i))=0;  %取阈值消除部分高频
    IFourier=real(ifft2(ifftshift(Fourier_shift)));  %傅里叶逆变换，要记得先把频移的频谱频移回去
    ret=uint8(IFourier); %将灰度级映射到0-255上
    subplot(2,2,i);
    imshow(ret);
    str=num2str(threshold(i));
    title(['阈值:',str]);
end

%----------------DCT变换------------------
clear;
close all;
color_pic=imread('0-2.png');  %读取图像
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
figure('name','DCT变换'); 
DCT=dct2(gray_pic);  %DCT变换
h_DCT=abs(DCT);  %DCT变换后的幅度
log_DCT=log(h_DCT);   %取模并进行缩放，调高频谱图像的低灰度值而对高灰度值仅可能减小
imshow(log_DCT,[]);
title('DCT变换');
colormap(gray(4));  %重新设置灰度级为4，便于查看DCT变换后的频谱图特点
colorbar;   %显示颜色栏

%----------------取阈值去除高频分量 DCT逆变换------------------
clear;
close all;
color_pic=imread('0-2.png');  %读取图像
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
threshold=[200,100,10,1];  %设置不同阈值 (高频部分能量低)
for i=1:4
    DCT=dct2(gray_pic); %DCT正变换
    h_DCT=abs(DCT);  %DCT变换后的幅度
    DCT(h_DCT<threshold(i))=0;  %DCT变换后取模得出的幅度值若小于20则至0
    IDCT=uint8(idct2(DCT));  %对图像进行DCT逆变换，并将灰度级映射到0-255上
    subplot(2,2,i);
    imshow(IDCT);
    str=num2str(threshold(i));
    title(['阈值:',str]);
end

%------------------沃尔什哈达玛变换------------------
clear;
close all;
color_pic=imread('0-2.png');  %读取图像
color_pic=imresize(color_pic,[512 512]);
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
figure('name','沃尔什哈达玛'); 
subplot(2,2,1);
imshow(gray_pic);
title('原灰度图像');    %imread读入源图像为三维，所以不能进行D=A*X*A
im2double_gray_pic=im2double(gray_pic);%必须对读取的图像做I=im2double(I),函数im2double 将其值归一化到0～1之间
Hada=hadamard(512); %生成512x512哈达玛矩阵
Hada_pic=Hada.*(im2double_gray_pic).*Hada;
Hada_pic2=Hada_pic/512;  %沃尔什哈达玛变换记得/(N*N=512*512)，此处只除512是为了频谱图效果好看
subplot(2,2,2);
imshow(Hada_pic2);
title('沃尔什哈达玛变换');

%----------------取阈值去除高频分量 沃尔什哈达玛逆变换------------------
clear;
close all;
color_pic=imread('0-2.png');  %读取图像
color_pic=imresize(color_pic,[512 512]);
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
im2double_gray_pic=im2double(gray_pic);%必须对读取的图像做I=im2double(I),函数im2double 将其值归一化到0～1之间
Hada=hadamard(512);%生成512x512哈达玛矩阵
Hada_pic=Hada*(im2double_gray_pic)*Hada;
threshold=[0.5,0.3,0.2,0.1];  %设置不同阈值 (高频部分能量低)
for i=1:4
    Hada_pic2=Hada_pic/(512);  %沃尔什哈达玛变换记得/(N*N=512*512)，此处只除512是为了频谱图效果好看
    h_Hada=abs(Hada_pic2);
    Hada_pic2(h_Hada<threshold(i))=0; %取阈值消除部分高频
    IHada_pic=Hada'*Hada_pic2*Hada';% Hada'是Hada的转置矩阵
    IHada_pic2=im2uint8(IHada_pic/512); %将灰度级转换为255级，否则灰度值大于255，图像太亮，呈现一片白
    subplot(2,2,i);
    imshow(IHada_pic2);
    str=num2str(threshold(i));
    title(['阈值:',str]);
end

%-------------------小波变换一级分解，小波基函数选db4-----------------------
clear;
close all;
color_pic=imread('0-2.png');  %读取图像
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
figure('name','小波变换一级分解');
[c,s]=wavedec2(gray_pic,1,'db4'); %小波一级分解,小波基函数采用db4
ca1=appcoef2(c,s,'db4',1);   %低频分量
ch1=detcoef2('h',c,s,1);     %高频水平分量
cv1=detcoef2('v',c,s,1);     %高频垂直分量
cd1=detcoef2('d',c,s,1);     %高频对角分量
subplot(2,2,1);imshow(ca1,[]);title('LL1');
subplot(2,2,2);imshow(ch1,[]);title('HL1');
subplot(2,2,3);imshow(cv1,[]);title('LH1');
subplot(2,2,4);imshow(cd1,[]);title('HH1');

%-------------------小波变换一级重构，小波基函数选db4-----------------------
clear;
close all;
color_pic=imread('0-2.png');  %读取图像
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
figure('name','小波变换一级重构');
[c,s]=wavedec2(gray_pic,1,'db4'); %小波一级分解,小波基函数采用db4
re_ca1=wrcoef2('a',c,s,'db4',1); %重建第一层低频分量系数
re_ch1=wrcoef2('h',c,s,'db4',1); %重建第一层高频水平分量系数
re_cv1=wrcoef2('v',c,s,'db4',1); %重建第一层高频垂直分量系数
re_cd1=wrcoef2('d',c,s,'db4',1); %重建第一层高频对角分量系数
re_set1=[re_ca1,re_ch1;re_cv1,re_cd1];  %将各个分量图像拼接在一张图像
subplot(1,2,1);imshow(re_set1,[]);title('第一层小波系数的重构');
re_img1=re_ca1+re_ch1+re_cv1+re_cd1;%将各个分量合并复原
subplot(1,2,2);imshow(re_img1,[]);title('一级重构图像');

%-------------------小波变换二级分解，小波基函数选db4)-----------------------
clear;
close all;
color_pic=imread('0.png');  %读取图像
gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
figure('name','小波变换二级分解');
[c,s]=wavedec2(gray_pic,2,'db4'); %小波二级分解
%小波一级分解分量
ca1=appcoef2(c,s,'db4',1);   %低频分量
ch1=detcoef2('h',c,s,1);     %高频水平分量
cv1=detcoef2('v',c,s,1);     %高频垂直分量
cd1=detcoef2('d',c,s,1);     %高频对角分量
%显示第1级分解各分量
subplot(4,4,[3,4,7,8]);imshow(ch1,[]);title('HL1');
subplot(4,4,[9,10,13,14]);imshow(cv1,[]);title('LH1');
subplot(4,4,[11,12,15,16]);imshow(cd1,[]);title('HH1');
%提取第2层的各分量
ca2=appcoef2(c,s,'db4',2);   %低频分量
ch2=detcoef2('h',c,s,2);     %高频水平分量
cv2=detcoef2('v',c,s,2);     %高频垂直分量
cd2=detcoef2('d',c,s,2);     %高频对角分量
%显示第2级分解各分量
subplot(4,4,1);imshow(ca2,[]);title('LL2');
subplot(4,4,2);imshow(ch2,[]);title('HL2');
subplot(4,4,5);imshow(cv2,[]);title('LH2');
subplot(4,4,6);imshow(cd2,[]);title('HH2');

% %-------------------小波变换2级重构，小波基函数选db4-----------------------
% clear;
% close all;
% color_pic=imread('0-2.png');  %读取图像
% gray_pic=rgb2gray(color_pic);  %将彩色图转换成灰度图
% figure('name','小波变换二级重构');
% [c,s]=wavedec2(gray_pic,2,'db4'); %小波二级分解
% re_ca2=wrcoef2('a',c,s,'db4',2);  %重建第二层低频分量系数
% re_ch2=wrcoef2('h',c,s,'db4',2);  %重建第二层高频水平分量系数
% re_cv2=wrcoef2('v',c,s,'db4',2);  %重建第二层高频垂直分量系数
% re_cd2=wrcoef2('d',c,s,'db4',2);  %重建第二层高频对角分量系数
% re_set2=[re_ca2,re_ch2;re_cv2,re_cd2]; %将各个分量图像拼接在一张图像
% subplot(1,2,1);imshow(re_set2,[]);title('第二层小波系数的重构');
% re_img2=re_ca2+re_ch2+re_cv2+re_cd2; %将各个分量合并复原
% subplot(1,2,2);imshow(re_img2,[]);title('二级重构图像');

clear;
close all;
%高斯低通
I=rgb2gray(imread('0-2.png'));
I2=rgb2gray(imread('0.png'));
%IA=imnoise(I,'gaussian');%%加入高斯白噪声
IA=I;

[f1,f2]=freqspace(size(IA),'meshgrid');
D=100/size(IA,1);
r=f1.^2+f2.^2;
Hd=ones(size(IA));
for i=1:size(IA,1)
    for j=1:size(IA,2)
        t=r(i,j)/(D*D);
        Hd(i,j)=exp(-t);
    end
end
Y=fft2(double(IA));
Y=fftshift(Y);
Ya=Y.*Hd;
Ya=ifftshift(Ya);
Ia=real(ifft2(Ya));
img=imsubtract(double(I),Ia);
img2=imsubtract(I,I2);
subplot(221),imshow(uint8(I));
title('对抗样本');
subplot(222),imshow(I2);
title('干净图像');
% subplot(223),imshow(uint8(Ia));
% title('高斯低通滤波处理');
subplot(223),imshow(uint8(img*10));
title('对抗样本的中高频信息');
subplot(224),imshow(uint8(img2*10));
title('对抗扰动');

clc;
clear all;
close all;
 
%读入图像，并转换为double型
I=rgb2gray(imread('0-2.png'));
I2=rgb2gray(imread('0.png'));
I_D=im2double(I);
%获得图像的高度和宽度
[M,N]=size(I_D);
%图像中心点
M0=M/2;
N0=N/2;
J=fft2(I_D);
J_shift=fftshift(J);
 
%%%%%%%============巴特沃斯（Butterworth）低通滤波器======================
%滤波器的阶数，巴特沃斯以二阶最为有效，灰度级的负数几乎为零，振铃现象很微小
n=2;
%截至频率距离圆点的距离
D0=20;
for x=1:M
    for y=1:N
        %计算点（x,y）到中心点的距离
        d=sqrt((x-M0)^2+(y-N0)^2);
        %计算巴特沃斯滤波器
        h=1/(1+(d/D0)^(2*n));
        %用滤波器乘以主函数
        J_shift(x,y)=J_shift(x,y)*h;
    end
end
 
J=ifftshift(J_shift);
I_D_rep=ifft2(J);

imshow(I_D_rep,[]);
% img=imsubtract(double(I),double(I_D_rep));
% img2=imsubtract(I,I2);
% 
% subplot(221),imshow(uint8(I));
% title('对抗样本');
% subplot(222),imshow(I2);
% title('干净图像');
% % subplot(223),imshow(uint8(Ia));
% % title('高斯低通滤波处理');
% subplot(223),imshow(uint8(img*10));
% title('对抗样本的中高频信息');
% subplot(224),imshow(uint8(img2*10));
% title('对抗扰动');


% 1、对lena图像采用高频强调滤波增强方法，
%    并分析方法的效果。（理想、巴特沃斯、高斯）
%    其结果好不好？能否有改善的方法？
%
% @author: jackma
% @time:   2020-10-19 10:15
% @URL:    www.jackrma.com
% @Copyright:博客所有权归本人和CSDN所有，如有转载请在显著位置给出博文
%            链接和作者姓名，否则本人将付诸法律。
% @edit:   
 
% 1. Lena图像采用高频强调滤波增强方法
clc
clear
imgrgb = imread('2orghist.png'); %读取彩色图像
imgrgc = imread('2mifgsmhist.png'); %读取彩色图像
f = rgb2gray(imgrgb); %将rgb图像转换成灰度图像
f2 = rgb2gray(imgrgc); %将rgb图像转换成灰度图像
% subplot(2, 2, 1);
% imshow(f)
% title('原始图像')
 
% %高斯高通滤波
% I = double(f);
% g = fft2(I);%二维傅立叶变换
% g = fftshift(g);%频移
% [M, N] = size(g);
% D0 = 5;%截止频率为5
% m = fix(M / 2); n = fix(N / 2);
%  
% for i = 1:M
%  
%     for j = 1:N
%         D = sqrt((i - m)^2 + (j - n)^2);
%         H = exp(-(D.^2) ./ (2 * (D0^2)));
%         result(i, j) = (1 - H) * g(i, j);
%     end
%  
% end
%  
% result = ifftshift(result);
% J1 = ifft2(result);
% J2 = uint8(real(J1));
% subplot(2, 2, 2);
% imshow(J2)
% title('高斯高通滤波后的图像')
%  
% %高频强调滤波
% F = 0.5 + 0.75 * (1 - H);
% G = F * g;
% result2 = ifftshift(G);
% J3 = ifft2(result2);
% J4 = uint8(real(J3));
% subplot(2, 2, 3)
% imshow(J4)
% title('高频强调滤波后的图像')
%  
% %对高频强调滤波后图像进行直方图均衡化
% J5 = histeq(J4, 256);
% J5 = uint8(J5);
% subplot(2, 2, 4);
% imshow(J5)
% title('直方图均衡化后的图像')
 
%%%%%巴特沃斯高通滤波
% figure('Name', '图像加入巴特沃斯高通滤波'); %标题
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
            H1(u, v) = 1 / (1 + (600 / D1)^4); %2阶巴特沃斯高通滤波器，截至频率为500
        end
 
    end
 
end
 
F1 = H1 .* a;
F1 = ifftshift(F1);
I2 = abs(ifft2(F1));
subplot(2, 2, 1);
imshow(imgrgb)
title('原始图像hist')
subplot(2, 2, 2);
imshow(I2*30)
title('原始图像-巴特沃斯高通滤波后的图像')
 

% figure('Name', '图像加入巴特沃斯高通滤波'); %标题
[M, N] = size(f2);
a = fft2(f2);
a = fftshift(a);
m1 = fix(M / 2); n1 = fix(N / 2);
 
for u = 1:M
 
    for v = 1:N
        D1 = sqrt((u - m1)^2 + (v - n1)^2);
 
        if D1 == 0
            H1(u, v) = 0;
        else
            %    H(u,v)=1/(1+0.414*(500/D1)^4);%截至频率为500
            H1(u, v) = 1 / (1 + (600 / D1)^4); %2阶巴特沃斯高通滤波器，截至频率为500
        end
 
    end
 
end
 
F1 = H1 .* a;
F1 = ifftshift(F1);
I3 = abs(ifft2(F1));
%高频强调滤波
% FF = 0.5 + 0.75 * (1 - H1);
% G1 = FF .* a;
% result3 = ifftshift(G1);
% J8 = ifft2(result3);
% J9 = uint8(real(J8));
subplot(2, 2, 3)
imshow(imgrgc)
title('对抗样本mifgsmhist(增强扰动)')
 
%对高频强调滤波后图像进行直方图均衡化
% J10 = histeq(J9, 256);
% J10 = uint8(J10);
subplot(2, 2, 4);
imshow(I3*30)
title('对抗样本-巴特沃斯高通滤波后的图像')