// 定义需要共享的数据模型，通过混入 ChangeNotifier 管理听众
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  // 读方法
  int get counter => _count;
  // 写方法
  void increment() {
    _count++;
    notifyListeners(); // 通知听众刷新
  }
}

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 通过 Provider 组件封装数据资源
    return FirstPage();
  }
}

// // 第一个页面，负责读数据
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 取出资源
    final _counter = Provider.of<CounterModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("FirstPage"),
        ),
        // 展示资源中的数据
        body: Text(
          'Counter: ${_counter.counter}',
          textAlign: TextAlign.center,
        ),
        // 跳转到 SecondPage
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondPage()))));
  }
}

// // 第二个页面，负责读写数据
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 取出资源
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      // 展示资源中的数据
      body: Consumer<CounterModel>(
          //builder 函数可以直接获取到 counter 参数
          builder: (context, CounterModel counter, _) =>
              Text('Value: ${counter.counter}')),
      // 用资源更新方法来设置按钮点击回调
      floatingActionButton: Consumer<CounterModel>(
        //builder 函数可以直接获取到 increment 参数
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: TestIcon(),
      ),
    );
  }
}

// 用于打印 build 方法执行情况的自定义控件
class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TestIcon build");
    return Icon(Icons.add); // 返回 Icon 实例
  }
}
