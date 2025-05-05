import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

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

  void task2() async {
    Future(() => print('Running in Future 1'));

    Future(() => print('Running in Future 2'))
        .then((_) => print('and then 1'))
        .then((_) => print('and then 2')); // 上一个事件循环结束后，连续输出三段字符串

    //f1 比 f2 先执行
    Future(() => print('f1'));
    Future(() => print('f2'));

    //f3 执行后会立刻同步执行 then 3
    Future(() => print('f3')).then((_) => print('then 3'));

    //then 4 会加入微任务队列，尽快执行
    Future(() => null).then((_) => print('then 4'));

    Future(() => print('f1')); // 声明一个匿名 Future
    Future fx = Future(() => null); // 声明 Future fx，其执行体为 null

    // 声明一个匿名 Future，并注册了两个 then。在第一个 then 回调里启动了一个微任务
    Future(() => print('f2')).then((_) {
      print('f3');
      scheduleMicrotask(() => print('f4'));
    }).then((_) => print('f5'));

    // 声明了一个匿名 Future，并注册了两个 then。第一个 then 是一个 Future
    Future(() => print('f6'))
        .then((_) => Future(() => print('f7')))
        .then((_) => print('f8'));

    // 声明了一个匿名 Future
    Future(() => print('f9'));

    // 往执行体为 null 的 fx 注册了了一个 then
    fx.then((_) => print('f10'));

    // 启动一个微任务
    scheduleMicrotask(() => print('f11'));
    print('f12');
  }
}

class IsolateExample {
  void startIsolate() async {
    final receivePort = ReceivePort(); // 用于接收子Isolate的消息

    await Isolate.spawn(worker, receivePort.sendPort); // 启动子Isolate并传入主Isolate的SendPort

    // 等待子Isolate的返回数据
    receivePort.listen((message) {
      print('主Isolate接收到: $message');
      receivePort.close(); // 关闭管道
      isolate.kill(priority: Isolate.immediate); // 杀死并发 Isolate
    });
  }

  // 子Isolate运行的函数
  void worker(SendPort sendPort) {
    sendPort.send('来自子Isolate的消息');
  }

  late Isolate isolate;

  // 并发计算阶乘
  Future<dynamic> asyncFactoriali(n) async {
    final response = ReceivePort(); // 创建管道
    // 创建并发 Isolate，并传入管道
    await Isolate.spawn(_isolate, response.sendPort);
    // 等待 Isolate 回传管道
    final sendPort = await response.first as SendPort;
    // 创建了另一个管道 answer
    final answer = ReceivePort();
    // 往 Isolate 回传的管道中发送参数，同时传入 answer 管道
    sendPort.send([n, answer.sendPort]);
    return answer.first; // 等待 Isolate 通过 answer 管道回传执行结果
  }

//Isolate 函数体，参数是主 Isolate 传入的管道
  _isolate(initialReplyTo) async {
    final port = ReceivePort(); // 创建管道
    initialReplyTo.send(port.sendPort); // 往主 Isolate 回传管道
    final message = await port.first as List; // 等待主 Isolate 发送消息 (参数和回传结果的管道)
    final data = message[0] as int; // 参数
    final send = message[1] as SendPort; // 回传结果的管道
    send.send(syncFactorial(data)); // 调用同步计算阶乘的函数回传结果
  }

// 同步计算阶乘
  int syncFactorial(n) => n < 2 ? n : n * syncFactorial(n - 1);
  asyncFactorialiMain() async => print(await asyncFactoriali(4)); // 等待并发计算阶乘结果

// 使用 compute 函数封装 Isolate 的创建和结果的返回
  asyncFactorialiMain2() async => print(await compute(syncFactorial, 4));
}
