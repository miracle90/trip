/// 定义一个Dart类，所有的类都继承自Object
class Student extends Person {
//  定义类的变量，_私有变量
  String _school;
  String city;
  String country;
  String name;
  // 初始化子类的构造方法
  // : 后面的表达式，称为类的初始化列表 super(name, age)
  // 通过 this._school 初始化自有参数
  // name，age 交给父类进行初始化
  // city 为可选参数
  // country 为默认参数，首先要为可选参数
  Student(this._school, String name, int age, {this.city, this.country = 'China'
      // 初始化列表，除了调用父类构造器，在子类构造器方法体之前，你也可以初始化实例变量，不同的初始化变量之间用逗号分隔
      // 如果父类没有默认构造方法（无参的构造方法），则需要在初始列表中调用父类的构造方法进行初始化
      })
      : name = '$country.$city',
        super(name, age) {
    print('构造方法体不是必须的！');
  }

  // 命名构造方法 [类名 + '.' + 方法名]
  // 使用命名构造方法为类实现多个构造方法
  Student.couver(Student stu) : super(stu.name, stu.age) {
    print('命名构造方法');
  }
}

class Logger {
  // 创建一个静态变量，一个类的实例
  static Logger _cache;
  // 工厂构造方法
  // 不仅仅是构造方法，更是一种模式
  // 有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求
  // 那么可以使用工厂模式来定义构造方法
  // 关键字 factory
  factory Logger() {
    // 实例为空
    if (_cache == null) {
      // 调用私有的命名构造方法
      _cache = Logger._internal();
    }
    return _cache;
  }
  Logger._internal();
  void log(String msg) {
    print(msg);
  }
}

class Person {
  String name;
  int age;

  //  标准构造函数
  Person(this.name, this.age);

  // 通过override，来重载父类的方法
  @override
  //  重写 toString 方法
  String toString() {
    return 'name: $name, age $age';
  }
}
