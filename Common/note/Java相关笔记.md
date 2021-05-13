#### Java中Map的使用

```java
// 新建Map对象
Map<String, String> map = new HashMap<>();
// 向map中存放值
map.put("name", "黄智浩");
map.put("age", "30");

// 从map中取出值
String name = map.get("name");
String age = map.get("age");
System.out.println(name);
System.out.println(age);

System.out.println("-------");
// 遍历map
for (String key:map.keySet()) {
String value = map.get(key);
System.out.println(value);
}
```

#### 提取整数的每一位

```java
int n = 1234;
	while (n != 0) {
	int m = n %10;
	System.out.println(m);
	n = n / 10;
}
```

#### 二分查找

只适用于排序好的数组

```java
public static int searchInsert(int[] nums, int target) {

  if (nums == null || nums.length == 0) return 0;
  int len = nums.length;
  int left = 0;
  int right = len - 1;

  if (target < nums[left])  return 0;
  if (target > nums[right]) return len;

  // 二分查找
  while (left <= right) {
    int middle = left + ((right - left) >> 2);
    if (nums[middle] > target) {
      right = middle - 1;
    }else if (nums[middle] < target){
      left = middle + 1;
    }else {
      // 刚好
      return middle;
    }
  }
  return -1;
}
```

