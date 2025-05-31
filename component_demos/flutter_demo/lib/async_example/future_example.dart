import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

import '../util/util.dart';

class FutureExample extends StatefulWidget {
  static String route = "FutureExample";
  const FutureExample({super.key});

  @override
  State<FutureExample> createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold(
        "Fututre探索",
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  EventLoop().task();
                },
                child: const Text("事件任务、微任务优先级")),
            TextButton(
                onPressed: () {
                  EventLoop().completer();
                },
                child: const Text("completer")),
            TextButton(
                onPressed: () {
                  EventLoop().task2();
                },
                child: const Text("异步源码研究"))
          ],
        ));
  }
}
