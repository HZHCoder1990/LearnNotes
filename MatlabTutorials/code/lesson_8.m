close all;
clc;

% 分别提取三个通道的图像
% 读取图像
I = imread('../images/lena.png');

% 提取R通道的图像
R = I;
R(:,:,1) = I(:,:,1);
R(:,:,2) = 0;
R(:,:,3) = 0;

% 提取G通道的图像
G = I;
G(:,:,1) = 0;
G(:,:,2) = I(:,:,2);
G(:,:,3) = 0;

% 提取B通道的图像
B = I;
B(:,:,1) = 0;
B(:,:,2) = 0;
B(:,:,3) = I(:,:,3);

subplot(1,4,1);imshow(I);
subplot(1,4,2);imshow(R);
subplot(1,4,3);imshow(G);
subplot(1,4,4);imshow(B);
