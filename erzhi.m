function erzhi(imgDataPath,save_path)

    imgDataDir = dir(imgDataPath); % 遍历所有文件
    for i = 3:length(imgDataDir)
        imgDir = dir(strcat(strcat(imgDataPath,"/"),imgDataDir(i).name));
        for j = 3:length(imgDir) % 遍历所有图片
            image_path = strcat('',strcat(strcat(strcat(strcat(imgDataPath,"/"),imgDataDir(i).name),strcat("/",imgDir(j).name)),''));
            disp(image_path);
            image = imread(image_path);
            thresh = rgb2gray(image);     %自动确定二值化阈值
            I2 = imbinarize(thresh,0.05); 
            save_erzhi_path = strcat('',strcat(strcat(strcat(strcat(save_path,"/"),imgDataDir(i).name),strcat("/",imgDir(j).name)),''));
            imwrite(thresh,save_erzhi_path);
        end
    end
end