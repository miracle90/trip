/// 定义一个Dart类，所有的类都继承自Object
class Student extends Person {
//  定义类的变量，_私有变量
  String _school;
  final String city;
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

  @override
  String toString() {
    return 'name: $name, school: ${this._school}, city: $city, country: $country, ${super.toString()}';
  }

  // 可以为私有字段设置 getter 来让外界获取到私有字段
  String get school => _school;

  // 可以为私有字段设置 setter 来控制外界对私有字段的修改
  set school(String value) {
    _school = value;
  }

  // 静态方法
  static doPrint(String str) {
    print('doPrint: $str');
  }

  // 命名构造方法 [类名 + '.' + 方法名]
  // 使用命名构造方法为类实现多个构造方法
  // 如果是 final 变量，必须作为参数
  Student.couver(Student stu, this.city) : super(stu.name, stu.age) {
    print('命名构造方法');
  }

  // 命名工厂构造方法 factory [类名 + '.' + 方法名]
  // 它可以有返回值，而且不需要将类的 final 变量作为参数，是提供一种灵活获取类对象的方式
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
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
  // 重写 toString 方法
  @override
  String toString() {
    return '父类toSring方法 => name: $name, age $age';
  }
}


class StudyFlutter extends Study {
  // 实现父类的抽象方法，否则就要加 abstract 修饰符，将自己定义成抽象类
  @override
  void study() {
    print('learning flutter');
  }
}

// 使用 abstract 修饰符来定义一个抽象类，该类不能被实例化，抽象类在定义接口的时候非常有用
abstract class Study {
  // 可以有抽象方法，也可以没有
  // 如果有抽象方法，必须是抽象类
  void study();
}

// 为类添加特征，mixins
// 要使用 mixins，在 with 关键字后面跟上一个或多个 mixin 的名字（多个用逗号分隔）
// mixins 的特征，实现 mixin，就创建一个继承 Object 类的子类（不能继承其他类），不声明任何构造方法，不能调用 super
class Test extends Person with Study {
  Test(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO
  }
}