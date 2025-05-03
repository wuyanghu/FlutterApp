import 'dart:async';

bool isFromFlutter = const bool.fromEnvironment("isFromFlutter");

class EventLoop {
  void task() {
    //实例2:
    // f12 f11
    // f1
    // f10 //() => null 没有包含任何异步操作（如 await 或 Future.delayed），所以 Future 会同步地立即完成，并立即触发 then 回调。
    // f2 f3 f5 f4
    // f6 f9
    // f7 f8 //Future()是重新创建一个

    Future(() => print('f1'));//声明一个匿名Future
    Future fx = Future(() =>  null);//声明Future fx，其执行体为null

//声明一个匿名Future，并注册了两个then。在第一个then回调里启动了一个微任务
    Future(() => print('f2')).then((_) {
      print('f3');
      scheduleMicrotask(() => print('f4'));//任务的优先级高于Future
    }).then((_) => print('f5'));

//声明了一个匿名Future，并注册了两个then。第一个then是一个Future
    Future(() => print('f6'))
        .then((_) => Future(() => print('f7')))//then中的Future会导致后边的then都是异步
        .then((_) => print('f8'));

//声明了一个匿名Future
    Future(() => print('f9'));

//往执行体为null的fx注册了了一个then
    fx.then((_) => print('f10'));//Future 的 then 回调会执行微任务，then都是接在Future完成之后同步执行的

//启动一个微任务
    scheduleMicrotask(() => print('f11'));
    print('f12');
  }
}