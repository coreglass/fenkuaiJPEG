<<<<<<< HEAD
function [avg]= PSNR_main(path_org,path2)
% clear % 清除工作区数据
% clc % 清除命令行数据
sum = 499;
PSNR = zeros(2*sum,1);
count=0;
m=0;
    for i=0:sum
        for q =2*i:2*i+1
                    path1 = path_org+"/"+num2str(i)+"/"+num2str(q)+".png";
                    %path2 = "C:/Users/Administrator/Desktop/CW (2)/AE_PGD7/"+num2str(i)+"/"+num2str(q)+".png";
                    path3 = path2+"/"+num2str(i)+"/"+num2str(q)+".png";
                    OriImg = imread(path1);
                    AE = imread(path3);
                  
                    m=m+1;
                    PSNR(m,1) = psnr(OriImg,AE);
                    count = count+PSNR(m,1);
                    
                    
                    subplot(1,2,1);
                    imshow(OriImg);
                    subplot(1,2,2);
                    imshow(AE);              
        end
    end
avg=count/m;
=======
function [avg]= PSNR_main(path_org,path2)
% clear % 清除工作区数据
% clc % 清除命令行数据
sum = 499;
PSNR = zeros(2*sum,1);
count=0;
m=0;
    for i=0:sum
        for q =2*i:2*i+1
                    path1 = path_org+"/"+num2str(i)+"/"+num2str(q)+".png";
                    %path2 = "C:/Users/Administrator/Desktop/CW (2)/AE_PGD7/"+num2str(i)+"/"+num2str(q)+".png";
                    path3 = path2+"/"+num2str(i)+"/"+num2str(q)+".png";
                    OriImg = imread(path1);
                    AE = imread(path3);
                  
                    m=m+1;
                    PSNR(m,1) = psnr(OriImg,AE);
                    count = count+PSNR(m,1);
                    
                    
                    subplot(1,2,1);
                    imshow(OriImg);
                    subplot(1,2,2);
                    imshow(AE);              
        end
    end
avg=count/m;
>>>>>>> 8616116aedaa6bdbb3c691c92d9bd8ce141bff0e
