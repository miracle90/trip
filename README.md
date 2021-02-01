# Flutter实战

## 采坑记录   

### 1、运行项目一直在 “Running Gradle task 'assembleDebug'...”

* 切换镜像
* 执行 `flutter precache`

```
maven { url 'https://maven.aliyun.com/repository/google' }
maven { url 'https://maven.aliyun.com/repository/jcenter' }
maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
```

## 一、环境搭建

* Flutter SDK
* 安卓环境
* IOS环境 => Xcode安装
* Android studio、vscode
* Flutter插件、Dart插件
* 模拟器安装、配置
* flutter doctor命令
* 环境变量配置

## 二、Dart

### 1、Dart概述

* 强类型语言 & 静态语言 => Java，C#等
* 面向对象的语言，OOP => Python，C++,Objective-C，Java等
* JIT：即时编译，开发期间，更快编译，更快的重载
* AOT：事前编译，release期间，更快更流畅

### 2、常用数据类型

## 三、Flutter基础

### 1、快速搭建和运行调试项目

### 2、Flutter包和插件的使用

### 3、StatelessWidget

* Container

### 4、StatefulWidget

* MaterialApp 页面根节点
* Scaffold，带有appBar，底部导航栏，侧边栏的组件
* AppBar，头部标题
* BottomNavigationBar，底部导航栏
* RefreshIndicator，刷新指示器
* Image => Image.nextwork
* TextField，输入框
* PageView，类似轮播

### 5、Flutter布局

### Container

### RenderObjectWidget 

* SingleChildRenderObjectWidget
  * Opacity
  * ClipOval
  * ClipRRect
  * PhysicalModel
  * Align
  * Padding
  * SizedBox
  * FractionallySizedBox
* MultiChildRenderObjectWidget
  * Stack
  * Flex
    * Column
    * Row
  * Wrap
  * Flow

### ParentDataWidget

* Positioned
* Flexible => Expanded 展开

### 6、路由和导航

* 定义 routes => 'less': (BuildContext context) => LessWidgetPage()
* Navigator.pushNamed(context, routeName)
* Navigator.push(context, MaterialPageRoute(builder: (context) => page))
* Navigator.pop(context)

### 7、检测用户手势以及处理点击事件

GestureDetector

* onTap 单击
* onDoubleTap 双击
* onLongPress 长按
* onTapCancel 点击取消
* onTapUp: (e) => fn() 松开
* onTapDown: (e) => fn() 按下

### 8、如何导入和使用Flutter的资源文件

* 图片
* 字体文件

1. pubspec.yaml => assets
2. AssetImage(path)

### 9、如何打开第三方应用

url_launcher 插件



