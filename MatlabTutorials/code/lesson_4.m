close all;
clc;

% ¶ÁÈ¡Í¼Ïñ
original_image = imread('../images/lena.png');
gray_image = rgb2gray(original_image);

subplot(1,2,1);imshow(original_image);
subplot(1,2,2);imshow(gray_image);