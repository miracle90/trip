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

