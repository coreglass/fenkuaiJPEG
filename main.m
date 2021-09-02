<<<<<<< HEAD


%% 4. 测试PSNR
path_org="00000.png";
path_AE="00003.png";
org = imread(path_org);
ae = imread(path_AE);
disp("PSNR:");
PSNR = psnr(org,ae);
disp("PSNR:");
=======


%% 4. 测试PSNR
path_org="00000.png";
path_AE="00003.png";
org = imread(path_org);
ae = imread(path_AE);
disp("PSNR:");
PSNR = psnr(org,ae);
disp("PSNR:");
>>>>>>> 8616116aedaa6bdbb3c691c92d9bd8ce141bff0e
disp(PSNR);