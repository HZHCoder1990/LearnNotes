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

