close all;
clc;

% �ֱ���ȡ����ͨ����ͼ��
% ��ȡͼ��
I = imread('../images/lena.png');

% ��ȡRͨ����ͼ��
R = I;
R(:,:,1) = I(:,:,1);
R(:,:,2) = 0;
R(:,:,3) = 0;

% ��ȡGͨ����ͼ��
G = I;
G(:,:,1) = 0;
G(:,:,2) = I(:,:,2);
G(:,:,3) = 0;

% ��ȡBͨ����ͼ��
B = I;
B(:,:,1) = 0;
B(:,:,2) = 0;
B(:,:,3) = I(:,:,3);

subplot(1,4,1);imshow(I);
subplot(1,4,2);imshow(R);
subplot(1,4,3);imshow(G);
subplot(1,4,4);imshow(B);
