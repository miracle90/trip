class TestFunction {
  FunctionLearn functionLearn = FunctionLearn();
  void start() {
    print('++++++++++++++++++++++++++++++++');
    print(functionLearn.sum(1, 2));
    functionLearn.anonymousFunction();
  }
}

class FunctionLearn {
  // 返回值类型可缺省，也可以为void，或具体的类型
  // 匿名方法
  // 参数
  int sum(int val1, int val2) {
    return val1 + val2;
  }
  _learn() {
    print('私有方法');
  }

  anonymousFunction() {
    var list = ['私有方法', '匿名方法'];
    // 匿名方法
    list.forEach((item) {
      print(item);
    });
  }
}
