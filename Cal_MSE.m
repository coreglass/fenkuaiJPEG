function  MSE = Cal_MSE(temp)
%% 根据公式求出MSE并返回
[h,w] = size(temp);
MSE = 0;
for i = 1:h
    for j = 1:w
        MSE = MSE + (temp(i,j))^2; 
    end
end
MSE = MSE/(h*w);
end
