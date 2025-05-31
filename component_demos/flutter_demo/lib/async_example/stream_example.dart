import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';
import 'package:rxdart/rxdart.dart';
import 'package:async/async.dart';

class StreamExample extends StatefulWidget {
  static String route = 'StreamExample';

  const StreamExample({super.key});

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  final streamController = StreamController<int>();
  final broadcastController = StreamController<int>.broadcast();
  int _count = 0;

  final streamA = Stream.periodic(Duration(seconds: 1), (i) => 'A$i');
  final streamB = Stream.periodic(Duration(seconds: 2), (i) => 'B$i');

  final stream1 = Stream.fromIterable([1, 2]);
  final stream2 = Stream.fromIterable([3, 4]);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    broadcastController.stream.listen((onData) => print("接收数据"), onDone: () {
      print("完成");
    }, onError: (error) {
      print('报错了$error');
    }, cancelOnError: true);

    // 案例1 :
    // 使用 RxDart: 监听多个流的变化，并处理组合处理
    CombineLatestStream.combine2(
      streamA,
      streamB,
      (a, b) => '$a + $b',
    ).listen((data) => print("监听多个流的变化" + data));

    // 案例2 :
    // 同时监听多个流，任意流有数据时立即响应。
    StreamGroup.merge([streamA, streamB])
        .listen((data) => print("同时监听多个流:$data"));

    // 案例3 : 按顺序连接流
    Stream<int> concatStreams(List<Stream<int>> streams) async* {
      for (final stream in streams) {
        yield* stream; // yield* 会将另一个流的所有事件转发到当前流
      }
    }

    concatStreams([stream1, stream2]).listen((onData) {
      print("合并两个数据:$onData");
    });

    //案例4：等待所有流完成并收集结果
    ZipStream.zip2(stream1, stream2, (a, b) => '$a$b').listen((onData) {
      print("等待所有流完成并收集结果:$onData");
    }); // 输出：A1, B2
  }

  //相当于返回了stream
  Stream<int> countStream() async* {
    for (int i = 0; i < 20; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i; // 每秒发出一个值
      if (i % 5 == 0) throw Exception('模拟错误');
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold(
      "stream Example",
      Center(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineLarge!,
          child: Column(
            children: [
              StreamBuilder<int>(
                stream: countStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('值：${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              StreamBuilder<int>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('值：${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    if (_count % 5 != 0) {
                      streamController.sink.add(_count++);
                    } else {
                      _count++;
                      streamController.sink.addError("stream error");
                    }
                  },
                  child: const Text("单个stream按钮+1")),
              StreamBuilder<int>(
                stream: broadcastController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('broadcast1_值：${snapshot.data}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              StreamBuilder<int>(
                stream: broadcastController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('broadcast2_值：${snapshot.data}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    broadcastController.sink.add(_count++);
                  },
                  child: const Text("broadcast按钮+1")),
            ],
          ),
        ),
      ),
    );
  }
}
