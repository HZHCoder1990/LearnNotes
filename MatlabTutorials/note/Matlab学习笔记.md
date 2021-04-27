# Matlab学习笔记

## 基础图像处理(Basic Image Processing)

- Lesson 1:Extracting Image Properties using MATLAB

  Extracing:抓取、取出

  ```matlab
  close all;
  clc;
  
  % 获取图像的基本信息
  info = imfinfo('../images/lena.png');
  % filename 带有文件路径
  image_name = info.Filename;
  % 修改日期
  modification_date = info.FileModDate;
  % 大小(占用的字节数)
  image_size = info.FileSize;
  % 宽度
  image_width = info.Width;
  % 高度
  image_height = info.Height;
  % 色彩深度 8/16/24/32
  color_depth = info.BitDepth;
  % 色彩格式 truecolor:真彩图
  color_type = info.ColorType;
  % 格式 png/jpg....
  image_type = info.Format
  
  % ......
  % 更多的文件信息 直接info不加";"即可在控制台看见
  ```

- Lesson 2:Reading,Changing Format and Writing Image using MATLAB

  ```matlab
  close all;
  clc;
  
  % 读取图像
  I = imread('../images/lena.png');
  % 修改图像格式 png => jpg
  imwrite(I,'../images/newLena.jpg');
  ```

  

### 语法(Syntax)



### 绘图(Graphics)



