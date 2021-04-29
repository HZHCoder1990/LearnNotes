# Vim配置及其使用

#### 前言

开始搞数据结构与算法了，准备使用Vim来刷题，不害怕手写算法！

#### 配置

- 新建文件夹

  ```nginx
  mkdir ~/.vim
  mkdir ~/.vim/colors
  ```

- 下载主题包

  我是从[主题包](https://github.com/flazz/vim-colorschemes)下载的，然后把下载好的色彩主题包中`/colors/`文件夹需要的主题拷贝到`~/.vim/colors/`中就可以使用了。

- 配置vim环境，使主题包生效

  在终端中输入以下命令

  ```nginx
  vim .vimrc
  ```

  打开*.vimrc*文件，输入下面两行文字:

  ```nginx
  colorscheme 主题名称 # 没有后缀,如我的主题是1989.vim 输入1989即可
  syntax on  # 同步
  ```

- 验证

  进入到需要创建文件的文件夹，使用vim创建一个*hello.c*文件

  ```nginx
  vim hello.c
  ```

  即可看见刚才添加的主题生效了

  <img src="../images/vimTheme.png" style="zoom:50%;" />

- 设置vim字体大小

  快捷键:Command  + "+"即可缩放字体 

  

#### 使用

快捷键(在正常模式下 ESC)

```nginx
h:左移一个字符
w:右移一个字符
k:上移一个字符
j:下移一个字符
0(数字):移动到本行第一个字符上
$:移动到行尾
u:撤销 (正常模式下)
x:上次当前字符
dd:删除当前行
dj:删除上一行
dk:删除下一行
yy:拷贝当前行
shift+p:在当前行粘贴
```



