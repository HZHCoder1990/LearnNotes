close all;
clc;

% ��ȡͼ��
I1 = imread('../images/lena.png');
I2 = imread('../images/flower.png');
I3 = imread('../images/avatar.jpg');

% ��ʾ 1��3��
subplot(1,3,1);imshow(I1);
subplot(1,3,2);imshow(I2);
subplot(1,3,3);imshow(I3);

