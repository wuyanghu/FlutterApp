
import 'dart:async';
import 'package:flutter/material.dart';

class MemoryLeakTimePage extends StatefulWidget {
  static String route = 'MemoryLeakTimePage';

  const MemoryLeakTimePage({super.key});

  @override
  _MemoryLeakTimePageState createState() => _MemoryLeakTimePageState();
}

class _MemoryLeakTimePageState extends State<MemoryLeakTimePage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // 每秒打印一次
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('Timer tick: ${DateTime.now()}');
    });
  }

  // ❌ 忘记实现 dispose，导致 Timer 一直运行，即使页面销毁
  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time内存泄漏示例')),
      body: Center(child: Text('我有内存泄漏哦！')),
    );
  }
}
