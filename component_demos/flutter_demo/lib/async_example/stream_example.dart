import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

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

  @override
  void initState() {
    super.initState();
  }

  //相当于返回了stream
  Stream<int> countStream() async* {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i; // 每秒发出一个值
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
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    streamController.sink.add(_count++);
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
