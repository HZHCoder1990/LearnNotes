

# RayMarching

##### Abstract

记录一下ShaderToy中3D场景的构建。

##### Ray Marching(射线行进)

**normalize**:归一化，通常用来表示方向(direction)

```glsl
# 比如一个向量
vec2 A = vec2(2,2);
# 执行归一化后
normalize(A) 
# 向量的方向不会发生改变，还是45°角;只是大小发生了改变，长度等于1 => length = 1
# x方向的夹角:
angleX = 2/sqrt(8)
angleY = 2/sqrt(8)
```

放一张很经典的图来描述3D场景:

<img src="../images/scene.png" style="zoom:75%;" />

#### Ray Marching

这里有一篇讲的很好的[文章](http://jamie-wong.com/2016/07/15/ray-marching-signed-distance-functions/)。引用GPU Gems2:Chapter 8中对Ray marching的描述的图片:

![](../images/spheretrace.jpeg)

图中:${p_0}$可以看做是观察点(eye,look_at)，我们怎么知道$p_4$点处需要绘制呢($p_0 到 p_4射线方向是固定的$)？首先以$p_0$处为中心画圆，半径尽可能的大，直到触碰到场景中其他的点；然后以$p_1$点为中心重复以上的操作，直到最后画圆的半径尽可能小，即找到了需要绘制的点。用代码表示:

```glsl
#define EPSILON 0.001   // 阈值
#define MAX_MARCHING_STEPS 100  // 搜寻的最大步骤

float sceneSDF(vec3 p){
   return length(p) - 1.;
}
float getDist(vec3 eye,vec3 viewRayDirection,float start,float end){
    float depth = start;
    for (int i = 0;i < MAX_MARCHING_STEPS;i ++){
        float dist = sceneSDF(eye + depth * viewRayDirection);
        if (dist < EPSILON){
            // We're inside the scene surface!
            return depth;
        }
        // Move along the view ray
        depth += dist;
        if (depth >= end){
            // Gone too far; give up
            return end;
        }
    }
    return end;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // <-1 1>
    vec2 uv = (fragCoord - .5 * iResolution.xy)/iResolution.y;
    vec3 ro = vec3(0.,0.,5.); 
    vec3 rd = normalize(vec3(uv,-1.));  
    float d = getDist(ro,rd,0.,100.); 
    vec3 col = vec3(0.);
    if (d >= 100.){ // 没撞到   注意大于等于号! >= end
       col = vec3(0.6);
    }else {
       col = vec3(0.,.5,.0);
    }
    fragColor = vec4(col,1.0);
}
```

我比较习惯下面的写法

```glsl
#define MAX_DIST 100.
#define EPSILON 0.001
#define MAX_MARCHING_STEPS 100   
// SDF:Signed Distance Function 符号距离函数
// 绘制球体 
float sdSphere(vec3 p,float r){
   return length(p) - r;
}

// ro:eye点
// rd:方向向量 即要对向量进行归一化处理 表示方向
float getDist(vec3 ro,vec3 rd){
   float depth = 0.;
  // 遍历 如果触碰到了遍历会走完 
   for (int i = 0;i < MAX_MARCHING_STEPS; i ++){
        // ro和rd的方向是相反的
        vec3 p = ro + depth * rd;
       // 1 代表绘制圆球的半径
        float d = sdSphere(p,1.);
        depth += d;
        if (depth < EPSILON || depth > MAX_DIST)  break;
   }
   return depth;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord - .5 * iResolution.xy)/iResolution.y;
    vec3 ro = vec3(0.,0.,4.);// 值越小 看到的越大 
    vec3 rd = normalize(vec3(uv,-1.)); // 负的越多 看到的越大 
    float d = getDist(ro,rd); 
    vec3 col = vec3(0.);
    if (d > MAX_DIST){ // 没撞到
       col = vec3(0.6);
    }
    else{ // 撞到了 绘制球体的表面
       col = vec3(0.,.5,.0);
    }
    fragColor = vec4(col,1.0);
}
```

<img src="../images/raymarching.png" style="zoom:50%;" />

#### Add Lighting

- 计算射线与球体相交点的法线向量(单位向量)

  在2D空间中，计算某一个点$f(x,y)$的斜率可以通过下面的公式:
  $$
  \vec k = \frac{f(x_1 + \Delta) - f(x_1)}{\Delta}
  $$
  在3D空间中，假设球体表面一个点的坐标为$f(x,y,z)$，那么可以计算法向量的公式为:

  <img src="../images/surface.png" style="zoom:50%;" />

  ```glsl
  // SDF
  float sceneSDF(vec3 p){
     return length(p) - 1.;
  }
  // p为球体表面点
  vec3 calcNormal(vec3 p){
     // ε
     float e = 0.005;
     return normalize(
             vec3(
                 sceneSDF(vec3(p.x + e,p.y,p.z)) - sceneSDF(vec3(p.x - e,p.y,p.z)),
                 sceneSDF(vec3(p,p.y + e,p.z)) - sceneSDF(vec3(p.x,p.y - e,p.z)),
                 sceneSDF(vec3(p.x,p.y,p.z + e)) - sceneSDF(vec3(p.x,p.y,p.z - e))
                 ));
  }
  ```

- Lambert Lighting

  兰伯特漫反射光照模型计算如下:
  $$
  C_{diffuse} = (C_{light}·M_{diffuse})Max(0,{\vec n·\vec l})
  $$
  <font color=#F00>123</font>



#### 单词

Slope:斜率

Sample:样本

