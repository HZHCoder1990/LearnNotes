close all;
clc;

% ��ȡͼ��Ļ�����Ϣ
info = imfinfo('../images/lena.png');
% filename �����ļ�·��
image_name = info.Filename;
% �޸�����
modification_date = info.FileModDate;
% ��С(ռ�õ��ֽ���)
image_size = info.FileSize;
% ���
image_width = info.Width;
% �߶�
image_height = info.Height;
% ɫ����� 8/16/24/32
color_depth = info.BitDepth;
% ɫ�ʸ�ʽ truecolor:���ͼ
color_type = info.ColorType;
% ��ʽ png/jpg....
image_type = info.Format

% ......
% ������ļ���Ϣ ֱ��info����";"�����ڿ���̨����


