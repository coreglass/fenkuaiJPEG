clc
clear

Im1 = imread('1.jpeg');
Im2 = imread('2.jpeg');

Im1 = rgb2gray(Im1);
Im2 = rgb2gray(Im2);

hn1 = imhist(Im1)./numel(Im1);
hn2 = imhist(Im2)./numel(Im2);

% Calculate the Euclidean distance
f = norm(hn1-hn2);