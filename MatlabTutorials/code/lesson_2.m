close all;
clc;

% ��ȡͼ��
I = imread('../images/lena.png');
% �޸�ͼ���ʽ png => jpg
imwrite(I,'../images/newLena.jpg');
