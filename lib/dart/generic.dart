import 'package:trip_app/dart/oop.dart';

class TestGeneric {
  void start() {
    Cache<String> cache1 = Cache();
    cache1.setItem('cache1', '666');
    String val = cache1.getItem('cache1');
    print('缓存 $val');

    Cache<int> cache2 = Cache();
    cache2.setItem('cache2', 999);
    int val2 = cache2.getItem('cache2');
    print('缓存 $val2');

    Member<Student> member = Member(Student('', '', 16));
    print(member.fixedName());
  }
}

// 泛型，通俗理解，就是解决类、接口、方法的复用性，以及对不特定数据类型的支持
// 泛型类，提高代码的复用度
class Cache<T> {
  static final Map<String, Object> _cached = Map();
  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T getItem(String key) {
    return _cached[key];
  }
}

// 有时候在实现类似通用接口的泛型中，期望的类型是某些特定类型时，这是可以使用类型约束
class Member<T extends Person> {
  T _person;

  // 泛型作用：约束参数类型
  Member(this._person);

  String fixedName() {
    return 'fixed: ${_person.name}';
  }
}
