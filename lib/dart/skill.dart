// 面向对象编程技巧
// 1、封装
// 2、继承
// 3、多态

// 点点点习惯
void main() {
  print('面向对象编程技巧');
  // 安全的调用 a?.foo()
  List list;
  print(list?.length);

  // 表达式设置默认值
  print(list?.length ?? -1);

  list = [];
  list.add(0);
  list.add('');
  list.add(null);
  if(list[0] == null || list[0] == '' || list[0] == 0) {
    print('list[0] is empty');
  }
  if ([null, '', 0].contains(list[0])) {
    print('list[0] is empty');
  }
}
