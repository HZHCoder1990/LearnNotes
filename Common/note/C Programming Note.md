# C Programming Note

- 二维指针作为参数传递

  ```c
  /// 测试二维指针作为函数参数传递
  /// @param ptr 指针
  /// @param length 数组长度 如果有时需要返回2个数 可以使用指针！
  void JustPointer(int **ptr,int *length){
      
      *length = 5;
      *ptr = (int *)malloc((*length) * sizeof(int));
      for (int i = 0; i < *length; i ++) {
          (*ptr)[i] = i + 10;
      }
  }
  
  int main(int argc, const char * argv[]) {
  
      int *array;
      int length;
  
      JustPointer(&array,&length);
      for (int i = 0; i < length; i ++) {
          printf("%d\n",array[i]);
      }
      printf("length = %d\n",length);
      
      free(array);
      return 0;
  }
  ```

  