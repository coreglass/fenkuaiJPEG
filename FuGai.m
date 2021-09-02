function FuGai(path_AE,path_mask)
% clc
% clear

    for i=0:499
        for q =2*i:2*i+1
            path1 = path_AE+"/"+num2str(i)+"/"+num2str(q)+".png";
            path2 = path_mask+"/"+num2str(i)+"/"+num2str(q)+".png";
            path3 = "AE/"+num2str(i)+"/"+num2str(q)+".png";
            A2 = imread(path1);%对抗样本
            A1 = imread(path2);%mask
            A3 = A1;
                if A1 == A2
                    disp('两幅图像一致');
                else    
    %                 disp('两幅图像不一致'); 
                end
            
                for j=1:224
                    for k=1:224
                        if (A3(j,k,1)==255 && A3(j,k,2)==255 && A3(j,k,3)==255)
                            for n=1:3
                                A3(j,k,n)=A2(j,k,n);
                            end
                        end
                    end
                end
            
    %         figure(1),imshow(A3);
            imwrite(A3,path3);
            i
        end
    end
