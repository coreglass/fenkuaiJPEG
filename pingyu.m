<<<<<<< HEAD
I1=imread('04.jpg');
I=rgb2gray(I1);
I=double(I);
[M,N]=size(I);
m=(M+1)/2;
n=(N+1)/2; 
d1=5;%截止频率
F=fftshift(fft2(I));%空域转频域，平移中心
H1=zeros(M,N);
G1=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H1(i,j)=exp(-d/(2*d1^2));
       G1(i,j)=H1(i,j)*F(i,j);
    end
end
O1=ifft2(ifftshift(G1));%平移中心，频域转空域
O1=real(O1);%取实数部分
subplot(3,2,1);imshow(I,[]);title('inpit');
subplot(3,2,2);imshow(O1,[]);title('output 5');



d2=20;%截止频率
H2=zeros(M,N);
G2=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H2(i,j)=exp(-d/(2*d2^2));
       G2(i,j)=H2(i,j)*F(i,j);
    end
end
O2=ifft2(ifftshift(G2));%平移中心，频域转空域
O2=real(O2);%取实数部分
subplot(3,2,3);imshow(O2,[]);title('output 20');



d3=50;%截止频率
H3=zeros(M,N);
G3=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H3(i,j)=exp(-d/(2*d3^2));
       G3(i,j)=H3(i,j)*F(i,j);
    end
end
O3=ifft2(ifftshift(G3));%平移中心，频域转空域
O3=real(O3);%取实数部分
subplot(3,2,4);imshow(O3,[]);title('output 50');



d4=80;%截止频率
H4=zeros(M,N);
G4=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H4(i,j)=exp(-d/(2*d4^2));
       G4(i,j)=H3(i,j)*F(i,j);
    end
end
O4=ifft2(ifftshift(G4));%平移中心，频域转空域
O4=real(O4);%取实数部分
subplot(3,2,5);imshow(O4,[]);title('output 80');



d5=250;%截止频率
H5=zeros(M,N);
G5=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H5(i,j)=exp(-d/(2*d5^2));
       G5(i,j)=H5(i,j)*F(i,j);
    end
end
O5=ifft2(ifftshift(G5));%平移中心，频域转空域
O5=real(O5);%取实数部分
subplot(3,2,6);imshow(O5,[]);title('output 250');

=======
I1=imread('04.jpg');
I=rgb2gray(I1);
I=double(I);
[M,N]=size(I);
m=(M+1)/2;
n=(N+1)/2; 
d1=5;%截止频率
F=fftshift(fft2(I));%空域转频域，平移中心
H1=zeros(M,N);
G1=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H1(i,j)=exp(-d/(2*d1^2));
       G1(i,j)=H1(i,j)*F(i,j);
    end
end
O1=ifft2(ifftshift(G1));%平移中心，频域转空域
O1=real(O1);%取实数部分
subplot(3,2,1);imshow(I,[]);title('inpit');
subplot(3,2,2);imshow(O1,[]);title('output 5');



d2=20;%截止频率
H2=zeros(M,N);
G2=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H2(i,j)=exp(-d/(2*d2^2));
       G2(i,j)=H2(i,j)*F(i,j);
    end
end
O2=ifft2(ifftshift(G2));%平移中心，频域转空域
O2=real(O2);%取实数部分
subplot(3,2,3);imshow(O2,[]);title('output 20');



d3=50;%截止频率
H3=zeros(M,N);
G3=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H3(i,j)=exp(-d/(2*d3^2));
       G3(i,j)=H3(i,j)*F(i,j);
    end
end
O3=ifft2(ifftshift(G3));%平移中心，频域转空域
O3=real(O3);%取实数部分
subplot(3,2,4);imshow(O3,[]);title('output 50');



d4=80;%截止频率
H4=zeros(M,N);
G4=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H4(i,j)=exp(-d/(2*d4^2));
       G4(i,j)=H3(i,j)*F(i,j);
    end
end
O4=ifft2(ifftshift(G4));%平移中心，频域转空域
O4=real(O4);%取实数部分
subplot(3,2,5);imshow(O4,[]);title('output 80');



d5=250;%截止频率
H5=zeros(M,N);
G5=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H5(i,j)=exp(-d/(2*d5^2));
       G5(i,j)=H5(i,j)*F(i,j);
    end
end
O5=ifft2(ifftshift(G5));%平移中心，频域转空域
O5=real(O5);%取实数部分
subplot(3,2,6);imshow(O5,[]);title('output 250');

>>>>>>> 8616116aedaa6bdbb3c691c92d9bd8ce141bff0e
