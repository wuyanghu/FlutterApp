import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:demo/bloc_demo/bloc_demo_bloc.dart';
import 'package:demo/bloc_demo/bloc_demo_page.dart';
import 'package:demo/soluation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:isolate';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flutter_实战/WPChapters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    //
    // final results = Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]);
    // print("results = $results");
  }

  @override
  Widget build(BuildContext context) {

    Widget _buildItem(String title,Widget body) {
      return ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => body));
      }, child: Text(title));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16,right: 16),
        children: <Widget>[
          // RepaintBoundary(
          //   child: CustomPaintRoute(),
          // ),
          _buildItem("bloc_demo", BlocDemoPage()),
          _buildItem("flutter实战", WPChaters()),
          // ScaleAnimationRoute1(
          //   key: UniqueKey(),
          // ),
          // const Text(
          //   'You have pushed the button this many times:',
          // ),
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void isolateFunction(SendPort sendPort) {
  sendPort.send('Hello from Isolate!');
}

class ScaleAnimationRoute extends StatefulWidget {
  const ScaleAnimationRoute({Key? key}) : super(key: key);

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Image.asset(
        "imgs/avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationRoute1 extends StatefulWidget {
  const ScaleAnimationRoute1({Key? key}) : super(key: key);

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //   animation: animation,
    //   child: const Icon(Icons.flag),
    //   builder: (BuildContext ctx, child) {
    //     return  Center(
    //       child: SizedBox(
    //         height: animation.value,
    //         width: animation.value,
    //         child: child,
    //       ),
    //     );
    //   },
    // );

    return GrowTransition(
        animation: animation,
        child: Container(
          child: Icon(Icons.flag),
          color: Colors.red,
        ));

    // return AnimatedImage(
    //   animation: animation,
    // );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({
    Key? key,
    required this.animation,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}


class CustomPaintRoute extends StatelessWidget {
  const CustomPaintRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300), //指定画布大小
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    var rect = Offset.zero & size;
    //画棋盘
    drawChessboard(canvas, rect);
    //画棋子
    drawPieces(canvas, rect);
  }

  void drawChessboard(Canvas canvas, Rect rect) {
    //棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0xFFDCC48C);
    canvas.drawRect(rect, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black38
      ..strokeWidth = 1.0;

    //画横线
    for (int i = 0; i <= 15; ++i) {
      double dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = rect.left + rect.width / 15 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }
  }

  //画棋子
  void drawPieces(Canvas canvas, Rect rect) {
    double eWidth = rect.width / 15;
    double eHeight = rect.height / 15;
    //画一个黑子
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    //画一个黑子
    canvas.drawCircle(
      Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  // 返回false, 后面介绍
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
