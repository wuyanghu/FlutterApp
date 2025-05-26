import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class MemoryLeakScaleAnimationPage extends StatefulWidget {
  static String route = 'MemoryLeakScaleAnimationPage';

  const MemoryLeakScaleAnimationPage({Key? key}) : super(key: key);

  @override
  _MemoryLeakScaleAnimationPageState createState() =>
      _MemoryLeakScaleAnimationPageState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _MemoryLeakScaleAnimationPageState
    extends State<MemoryLeakScaleAnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    //匀速
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        if (mounted) setState(() => {});
      });

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scale"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          print("${animation.value}");
          return Icon(
            Icons.headphones,
            size: animation.value,
          );
        }),
      ),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    // controller.dispose();
    super.dispose();
  }
}

class MemoryLeakScrollControllerPage extends StatefulWidget {
  static String route = 'MemoryLeakScrollControllerPage';

  const MemoryLeakScrollControllerPage({super.key});

  @override
  State<MemoryLeakScrollControllerPage> createState() =>
      _MemoryLeakScrollControllerPageState();
}

class _MemoryLeakScrollControllerPageState
    extends State<MemoryLeakScrollControllerPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return buildScaffold(
        "ScrollController leak",
        ListView.builder(
          controller: _controller,
          itemBuilder: (_, i) => Text('Item $i'),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
