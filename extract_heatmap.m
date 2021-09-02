
    clear
    clc

        for i=0:499
            for q =2*i:2*i+1
            path1 = "C:/Users/Administrator/Desktop/CW (2)/AE_FGSM_CAM/"+num2str(i)+"/"+num2str(q)+".png";
            path2 = "AE_LVBO3/"+num2str(i)+"/"+num2str(q)+".png";
            path3 = "AE_mask/"+num2str(i)+"/"+num2str(q)+".png";
            I = imread(path1);
            heat_map = imread(path2);
            %B = imresize(A,[224 NaN]);
            % Simple, manual color thresholding   
            %I(:,:,1)表示R通道；I(:,:,2)表示G通道；I(:,:3)表示B通道
            %mask 阈值 为 0-255 分成 12 份 每份 20个点
            mask1 = I(:,:,1) >120;


            % Morphological processing
            mask2 = imdilate(mask1, strel('disk',5,0)); %对图像实现膨胀操作
            mask2 = imfill(mask2, 'holes');
            %figure(2),imshow(mask2);

            % Extract heat map
            %heat_map = B;
            heat_map(~repmat(mask2,[1 1 3])) = 255;
            %imshow(heat_map)
            imwrite(heat_map,path3);
            i
            end
        end

