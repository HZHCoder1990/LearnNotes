#include <stdio.h>
#include <stdbool.h>
#include <string.h>

// pragram s:输入数组1
// 
bool isAnagram(char *s,char *t){
 // 判断传入的数组长度是否相等
 int lenS = strlen(s);
 int lenT = strlen(t);
 if (lenS != lenT){
    return false;
 }
 
 // 使用2个数组来保存对应位置的字母的个数 {0,0,0,0,......}
 int statS[26] = {0};
 int statT[26] = {0};
 int i,j;
 for (i = 0; i < lenS; i ++){
     int index = s[i] - 'a';
     statS[index] ++; // 统计个数+1
  }
 for (j = 0; j < lenT; j++){
    int index = t[j] - 'a';
    statT[index] ++;
  }
 for (int k = 0; k < 26; k ++){
     if (statS[k] != statT[k]){  // 判断相同位置的字母的个数是否相同
        return false;
    }
  } 
  return true;
}

int main(){

  char *a = "abc";
  char *b = "bca";
  bool result = isAnagram(a,b);
  printf("结果=%d\n",result);
  return 0;
}
