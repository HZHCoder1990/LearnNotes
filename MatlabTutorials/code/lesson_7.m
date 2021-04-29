close all;
clc;

% 读取图像
image_variable = imread('../images/lena.png');
% 第一个通道 红色
red_value = image_variable(50,60,1);
% 第二个通道 绿色
green_value = image_variable(50,60,2);
% 第三个通道 蓝色
blue_value = image_variable(50,60,3);
sprintf("red_value = %d green_value = %d  blue_value = %d",red_value,green_value,blue_value);