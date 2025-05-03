import 'package:flutter_demo/paint/custom_paint.dart';
import 'package:flutter_demo/provider/provider_demo.dart';
import 'package:flutter_demo/status_manager/bloc_demo/bloc_demo_page.dart';
import 'package:flutter_demo/status_manager/bloc_demo/bloc_example.dart';
import 'package:flutter_demo/status_manager/get/get_page.dart';
import 'package:flutter_demo/switch/switch_demo.dart';
import 'package:flutter_demo/tab_demo/tab_demo.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/paint/custom_paint.dart';
import 'package:flutter_demo/status_manager/bloc_demo/bloc_demo_page.dart';
import 'dart:isolate';
import 'flutter_实战/WPChapters_screen.dart';
import 'slider/symmetric_slider_demo.dart';

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
      home: const FlutterDemoHomePage(
        title: 'Flutter Demo Home Page',
        hideAppBar: false,
      ),
    );
  }
}

class FlutterDemoHomePage extends StatefulWidget {
  const FlutterDemoHomePage({super.key, required this.title, this.hideAppBar});
  final String title;
  final bool? hideAppBar;

  @override
  State<FlutterDemoHomePage> createState() => _FlutterDemoHomePageState();
}

class _FlutterDemoHomePageState extends State<FlutterDemoHomePage> {
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
    Widget _buildItem(String title, Widget? body, {VoidCallback? onTap}) {
      return ElevatedButton(
          onPressed: () {
            if (onTap != null) {
              onTap!.call();
              return;
            }
            Navigator.push(context, MaterialPageRoute(builder: (_) => body!));
          },
          child: Text(title));
    }

    return Scaffold(
      appBar: widget.hideAppBar == true
          ? null
          : AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: <Widget>[
          _buildItem("CustomPaint_demo", CustomPaintDemo()),
          _buildItem("bloc_demo", BlocDemoPage()),
          _buildItem("bloc_官方demo", BlocExample()),
          _buildItem("get_demo", GetPage()),
          _buildItem("flutter实战", WPChaters()),
          _buildItem("provider_demo", ProviderDemo()),
          _buildItem("slider_demo", SymmetricSliderDemo()),
          _buildItem("switch_demo", SwitchDemo()),
          _buildItem("tab_异常_demo", TabDemo()),
          _buildItem("事件任务、微任务", null, onTap: () {
            EventLoop().task();
          })
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
