function GSLB(QF,path_AE,path_GSLVBO)
% clc;
% clear;
for i=0:499
    for n =2*i:2*i+1
        path1 = path_AE+"/"+num2str(i)+"/"+num2str(n)+".png";
        path2 = path_GSLVBO+"/"+num2str(i)+"/"+num2str(n)+".png";
       

        I1=imread(path1); 
        %OutImg1=I1; 
        R1=I1(:,:,1); G1=I1(:,:,2); B1=I1(:,:,3);
        q = QF;%滤波半径
        R120=fspecial('gaussian',[q,q],5);
        R1120=imfilter(R1,R120,'replicate','same','conv');
        
        G120=fspecial('gaussian',[q,q],5);
        G1120=imfilter(G1,G120,'replicate','same','conv');
        
        B120=fspecial('gaussian',[q,q],5);
        B1120=imfilter(B1,B120,'replicate','same','conv');
        Q120=cat(3,R1120,G1120,B1120);
%         subplot(1,2,1);imshow(Q120,[]);title("output 空域 半径",q); 
        imwrite(Q120,path2);
        
% 
% 
%     R150=fspecial('gaussian',[3,3],5);
%     R1150=imfilter(R1,R150,'replicate','same','conv');
%     G150=fspecial('gaussian',[3,3],5);
%     G1150=imfilter(G1,G150,'replicate','same','conv');
%     B150=fspecial('gaussian',[3,3],5);
%     B1150=imfilter(B1,B150,'replicate','same','conv');
%     Q150=cat(3,R1150,G1150,B1150);
%     subplot(3,2,4);imshow(Q150,[]);title('output 空域 半径3'); 
%     imwrite(Q150,'05 空域半径3.jpg');
% 
% 
%     R180=fspecial('gaussian',[4,4],5);
%     R1180=imfilter(R1,R180,'replicate','same','conv');
%     G180=fspecial('gaussian',[4,4],5);
%     G1180=imfilter(G1,G180,'replicate','same','conv');
%     B180=fspecial('gaussian',[4,4],5);
%     B1180=imfilter(B1,B180,'replicate','same','conv');
%     Q180=cat(3,R1180,G1180,B1180);
%     subplot(3,2,5);imshow(Q180,[]);title('output 空域 半径4'); 
%     imwrite(Q180,'05 空域半径4.jpg');
% 
% 
%     R1250=fspecial('gaussian',[5,5],5);
%     R11250=imfilter(R1,R1250,'replicate','same','conv');
%     G1250=fspecial('gaussian',[5,5],5);
%     G11250=imfilter(G1,G1250,'replicate','same','conv');
%     B1250=fspecial('gaussian',[5,5],5);
%     B11250=imfilter(B1,B1250,'replicate','same','conv');
%     Q1250=cat(3,R11250,G11250,B11250);
%     subplot(3,2,6);imshow(Q1250,[]);title('output 空域 半径5'); 
%     imwrite(Q1250,'05 空域半径5.jpg');
 

    end
end