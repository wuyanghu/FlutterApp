import 'package:flutter/material.dart';

class CountContainer extends InheritedWidget {
  // 方便其子 Widget 在 Widget 树中找到它
  static CountContainer? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>();

  final int count;

  CountContainer({
    Key? key,
    required this.count,
    required Widget child,
  }) : super(key: key, child: child);

  // 判断是否需要更新
  @override
  bool updateShouldNotify(CountContainer oldWidget) => count != oldWidget.count;
}

class CustomInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomInheritedWidgetState();
  }
}

class _CustomInheritedWidgetState extends State<CustomInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    // 将 CountContainer 作为根节点，并使用 0 作为初始化 count
    return CountContainer(count: 0, child: Counter());
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取 InheritedWidget 节点
    CountContainer? state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("InheritedWidget demo")),
      body: Text(
        'You have pushed the button this many times: ${state?.count}',
      ),
    );
  }
}
