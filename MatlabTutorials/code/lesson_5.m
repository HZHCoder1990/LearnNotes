close all;
clc;

% 读取图像
image_variable = imread('../images/lena.png');

% 分别获取三个通道的像素值
red_channel = image_variable(:,:,1);
green_channel = image_variable(:,:,2);
blue_channel = image_variable(:,:,3);

subplot(1,3,1);imshow(red_channel);
subplot(1,3,2);imshow(green_channel);
subplot(1,3,3);imshow(blue_channel);