close all;
clc;

% ��ȡͼ��
image_variable = imread('../images/lena.png');
% ��һ��ͨ�� ��ɫ
red_value = image_variable(50,60,1);
% �ڶ���ͨ�� ��ɫ
green_value = image_variable(50,60,2);
% ������ͨ�� ��ɫ
blue_value = image_variable(50,60,3);
sprintf("red_value = %d green_value = %d  blue_value = %d",red_value,green_value,blue_value);