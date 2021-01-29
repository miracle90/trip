import 'package:flutter/material.dart';

/// 常用数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container(
      child: Text('常用数据类型，请查看控制台'),
    );
  }

  ///  数字类型，是数字类型的父类
  void _numType() {
    num num1 = -1.0; // num，既接受整型，也接受浮点型
    num num2 = 2; // num，既接受整型，也接受浮点型
    int int1 = -1; // 整型
    double double1 = 8.888; // 双精度

    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    print('num $num1 num $num2 int $int1 double $double1');
    print('绝对值 ${num1.abs()}');
    print('类型转换 ${num1.toInt()}');
    print('类型转换 ${num1.toDouble()}');
  }

  /// 字符串类型
  _stringType() {
    String str1 = '字符串', str2 = "双引号";
    String str3 = 'str1 = $str1；str2 = $str2';
    String str4 = 'str1 = ' + str1 + '；str2 = ' + str2;
    String str5 = '0123456789';
    // print(str1);
    // print(str2);
    print(str3);
    print(str4);

    // 常用方法
    print(str5.substring(2));
    print(str5.indexOf('3'));
    // startsWith、replaceAll、contains、split等
  }

  /// 布尔类型，Dart是强 bool 类型检查，只有 bool 类型的值是 true 或 false，才可以
  _boolType() {
    bool bool1 = true, bool2 = false;
    print(bool1);
    print(bool2);
    print(bool1 || bool2);
    print(bool1 && bool2);
  }

  /// List集合
  _listType() {
    List list1 = [1, 2, true, 'str']; // 初始化时添加元素，默认是泛型，支持任何类型
    print(list1);
    List<int> list2 = [1, 2, 3];
    print(list2);
    List list3 = [];
    list3.add('list3'); // 通过add方法添加元素
    list3.addAll(list1);
    print(list3);
    List list4 = List.generate(5, (index) => index * 2);
    print(list4);

    // 集合的遍历方式 for循环
    for (int i = 0; i < list4.length; i++) {
      print('for循环 ${list4[i]}');
    }

    for (var o in list4) {
      print('for in $o');
    }

    list4.forEach((val) {
      print('forEach $val');
    });

    print(list4);
    list4.remove(8);
    print(list4);
    print('~~~~~~~~~~ list map ~~~~~~~~~~~~~');
    var list6 = list4.asMap();
    print(list6);
    // 其他方法 removeXX，insert，sublist，indexOf等
  }

  _mapType() {
    // key和value相关联，key和value都可以是任何类型的对象，并且key是唯一的，如果重复，后面覆盖前面的
    print('~~~~~~~~ Map ~~~~~~~~~');
    Map names = {
      'a': 'a',
      'b': 'b',
    };
    print(names);
    Map ages = {};
    ages['lyy'] = 18;
    print(ages);
    ages['dyy'] = 'abc';
    print(ages);

    // Map的遍历
    ages.forEach((key, value) {
      print('$key , $value');
    });

    Map mapMap = ages.map((key, value) {
      return MapEntry(key, 'map $value');
    });
    print(mapMap);
    for (var key in ages.keys) {
      print('$key => ${ages[key]}');
    }
    // keys、values、remove、containsKey
  }
  /// dynamic、var、Object 三者的区别
  _tips() {
    // dynamic 尽量不要使用，会带来一些隐患
    dynamic x = 'hello';
    print(x.runtimeType);
    print(x);
    x = 123;
    print(x.runtimeType);
    print(x);

    // var，不能修改类型
    var a = 'var';
    print(a.runtimeType);
    print(a);
    // a = 123; // 报错

    // Object，Dart对象的基类
    Object o1 = '111';
    print(o1.runtimeType);
    print(o1);
    o1 = 123;
    print(o1);
  }
}
