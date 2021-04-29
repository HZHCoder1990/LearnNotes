close all;
clc;

% 读取图像
image_variable = imread('../images/lena.png');
gray_image = rgb2gray(image_variable);
% 读取(50,60)位置处的像素
pixel_value = gray_image(50,60);
sprintf("value = %d",pixel_value);