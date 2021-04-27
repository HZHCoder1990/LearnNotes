close all;
clc;

% 读取图像
I1 = imread('../images/lena.png');
I2 = imread('../images/flower.png');
I3 = imread('../images/avatar.jpg');

% 显示 1行3列
subplot(1,3,1);imshow(I1);
subplot(1,3,2);imshow(I2);
subplot(1,3,3);imshow(I3);

