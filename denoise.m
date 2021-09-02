<<<<<<< HEAD
clc
clear
 
var=0.05;
noise_type='gaussian';

for q =0:499
    root = "C:/Users/Administrator/Desktop/CW (2)/AE_PGD7/";
    path = root + num2str(q)+"/";
    for z = 2*q:2*q+1
        src_img = imread(path + num2str(z)+".png");
        for n=1:100
            img_noise=imnoise(src_img,noise_type,var);
            for i=1:3
                for j=1:224
                    for k=1:224
                        th_img(j,k,i)= ((src_img(j,k,i)*0.4 + img_noise(j,k,i))*0.7/0.8);
                    end
                end
            end
        end
        save_path= "C:/Users/Administrator/Desktop/CW (2)/AE_PGD_2/" + num2str(q)+"/" + num2str(z)+".png";
        imwrite(th_img,save_path);
    end
end
        
        
=======
clc
clear
 
var=0.05;
noise_type='gaussian';

for q =0:499
    root = "C:/Users/Administrator/Desktop/CW (2)/AE_PGD7/";
    path = root + num2str(q)+"/";
    for z = 2*q:2*q+1
        src_img = imread(path + num2str(z)+".png");
        for n=1:100
            img_noise=imnoise(src_img,noise_type,var);
            for i=1:3
                for j=1:224
                    for k=1:224
                        th_img(j,k,i)= ((src_img(j,k,i)*0.4 + img_noise(j,k,i))*0.7/0.8);
                    end
                end
            end
        end
        save_path= "C:/Users/Administrator/Desktop/CW (2)/AE_PGD_2/" + num2str(q)+"/" + num2str(z)+".png";
        imwrite(th_img,save_path);
    end
end
        
        
>>>>>>> 8616116aedaa6bdbb3c691c92d9bd8ce141bff0e
        