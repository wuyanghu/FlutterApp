import 'package:flutter/material.dart';
import 'package:flutter_demo/memory_example/memory_leak_scale_animiation_page.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class MemoryLeakBuildcontextPage extends StatefulWidget {
  static String route = 'MemoryLeakBuildcontextPage';

  const MemoryLeakBuildcontextPage({super.key});

  @override
  State<MemoryLeakBuildcontextPage> createState() =>
      _MemoryLeakBuildcontextPageState();
}

class _MemoryLeakBuildcontextPageState
    extends State<MemoryLeakBuildcontextPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      // ❌ 可能页面已经销毁，context 却被保留
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => MemoryLeakScaleAnimationPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold("BuildContext leak", SizedBox());
  }
}
