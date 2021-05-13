#### 实现strStr()

给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

**示例 1：**

```java
输入：haystack = "hello", needle = "ll"
输出：2
```

**示例 2：**

```java
输入：haystack = "aaaaa", needle = "bba"
输出：-1
```

<font color=FF6347 size=4>暴力遍历解法: </font>

分别取出*haystck(长度为m)*和*needle(长度为n)*的每一个字符进行比较。算法比较简单，此处不赘述。复杂度:$O(m*n)$

```java
public static int strStr(String haystack, String needle) {

    int m = haystack.length()
		int n = needle.length();
		if (n == 0) return 0;
		if (n > m) return -1;
	
		for (int i = 0; i < m; i ++) {
			int total = 0;
			for (int j = 0; j < n; j++) {
				int index = i + j;
        // 超出长度了
				if (index >= m) break;
				char c = haystack.charAt(index);
				char s = needle.charAt(j);
        // 字符相同 长度加1
				if (c == s) total ++;
        // 字符不相同 跳过当前位 从下一位开始比较
				else break;
			}
      // 相同字符累加的长度相同 找到了
			if (total == n) 	return i;
		}
		return -1;
}
```



#### KMP算法

网上对**KMP**算法介绍挺多的，这里记录一下**KMP**算法的核心，便于理解。

- 字符串的前缀与后缀

  比如一个字符串:str = ababab，它的前缀表示为除开末尾最后一个字符的子字符串的集合，即:

  {"a","ab","aba","abab","ababa"}；同理后缀表示为除开开头的第一个字符的子字符串的集合，即:{"babab","abab","bab","ab","b"}。如果把前缀和后缀交集中最长元素的长度放入一个数组中进行保存，这个数组叫做PMT(Partial Match Table，匹配表)。如在本例中，交集中最长字符串为："abab"，长度为4。

- PMT

  字符串:str = ababab，PMT如下:

  