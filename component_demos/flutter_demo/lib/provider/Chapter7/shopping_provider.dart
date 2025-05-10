import 'package:flutter/material.dart';

// 一个通用的InheritedWidget，保存任需要跨组件共享的状态
class CommonInheritedProvider<T> extends InheritedWidget {
  //共享状态使用泛型
  final T data;
  const CommonInheritedProvider({
    super.key,
    required this.data,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(CommonInheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

class CustomChangeNotifier implements Listenable {
  List listeners = [];
  @override
  void addListener(VoidCallback listener) {
    //添加监听器
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    //移除监听器
    listeners.remove(listener);
  }

  void notifyListeners() {
    //通知所有监听器，触发监听器回调
    listeners.forEach((item) => item());
  }
}

class ChangeNotifierProvider<T extends CustomChangeNotifier>
    extends StatefulWidget {
  final Widget child;
  final T data;

  ChangeNotifierProvider({
    Key? key,
    required this.data,
    required this.child,
  });

  //定义一个便捷方法，方便子树中的widget获取共享数据
  // static T of<T>(BuildContext context) {
  //   // final type = _typeOf<InheritedProvider<T>>();
  //   final provider =
  //       context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
  //   return provider.data;
  // }

  //添加一个listen参数，表示是否建立依赖关系
  static T? of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context
            .dependOnInheritedWidgetOfExactType<CommonInheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<
                CommonInheritedProvider<T>>()
            ?.widget as CommonInheritedProvider<T>;
    return provider?.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends CustomChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonInheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
