## 一、构建FLutter实例项目

* [https://github.com/miracle90/flutter/tree/master/examples](https://github.com/miracle90/flutter/tree/master/examples)
* [https://github.com/flutter/samples](https://github.com/flutter/samples)
* [https://github.com/iampawan/fluttercalculator](https://github.com/iampawan/fluttercalculator)

### 如何运行？

Android Studio 直接打开 flutter/examples/XXX

## 二、图片控件开发详解

Image Widget

### 如何加载网络图片？

```dart
Image.network('http://www.devio.org/img/avatar.png');
```

### 如何加载静态图片？

pubspec.yaml声明图片路径
```dart
Image(
  height: 100,
  width: 100,
  image: AssetImage(src)
);

Image.asset(src);
```

### 如何加载本地图片？

```
import 'dart:io';
Image.file(File(src));
```

### 如何设置Placeholder？

借助FadeImImage

需要在 pubspec.yaml 添加 transparent_image 插件

### 如何配置图片缓存？

cached_network_image 插件加载缓存图片

### 如何加载Icon？

内置的 material_fonts

```dart
Icon(Icons.android, size: 100);
```

#### 自定义Icon

在 pubspec.yaml 中配置icon路径

```yaml
fonts:
    - family: devio
      fonts: 
        - asset: fonts/devo.ttf
```

代码中使用

```dart
const IconData(
);
```
## 三、动画 Animation 开发指南

### 在Flutter中有哪些类型的动画？

* 基于tween，补间动画
* 基于物理

### 如何使用动画库中的基础类给 widget 添加动画？

* Animation
* CurvedAnimation
* AnimationController
* Tween

### 如何为动画添加监听器

### 该什么时候使用 AnimatedWidget 与 AnimatedBuilder？

### 如何使用 Hero 动画？

## 四、Flutter调试技巧