function  MSE = Cal_MSE(temp)
%% ���ݹ�ʽ���MSE������
[h,w] = size(temp);
MSE = 0;
for i = 1:h
    for j = 1:w
        MSE = MSE + (temp(i,j))^2; 
    end
end
MSE = MSE/(h*w);
end
