close all;
clc;

% ��ȡͼ��
image_variable = imread('../images/lena.png');
gray_image = rgb2gray(image_variable);
% ��ȡ(50,60)λ�ô�������
pixel_value = gray_image(50,60);
sprintf("value = %d",pixel_value);