import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:performance_demo/time_consuming_page.dart';

import 'custom_painter_page.dart';
import 'lazy/iv_builder_page.dart';
import 'lazy/iv_builder_table_page.dart';
import 'lazy/iv_slow_page.dart';
import 'lazy/lazy_main.dart';
import 'lazy/list_view_builder_page.dart';
import 'lazy/procedural_generation_page.dart';
import 'lazy/single_child_scroll_view_page.dart';

void main() {
  debugProfilePaintsEnabled = true;
  debugProfileLayoutsEnabled = true;
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

void main2() {
  PictureRecorder recorder = PictureRecorder();

  ContainerLayer containerLayer = ContainerLayer();
  PaintingContext paintingContext = PaintingContext(containerLayer, Rect.zero);

  Paint circle1Paint= Paint();
  circle1Paint.color = Colors.blue;

  // 注释1
  // paintingContext.canvas.save();

  // 对画布进行裁剪
  //
  paintingContext.canvas.clipRect(Rect.fromCenter(center: Offset(400, 400), width: 280, height: 600));

  // 在裁剪后的画布上画一个⭕️
  //
  paintingContext.canvas.drawCircle(Offset(400, 400), 300, circle1Paint);

  // 注释2
  // paintingContext.canvas.restore();

  void _painter(PaintingContext context, Offset offset) {
    Paint circle2Paint = Paint();
    circle2Paint.color = Colors.red;
    context.canvas.drawCircle(Offset(400, 400), 250, circle2Paint);
  }

  // 通过 pushClipRect 方法再次执行裁剪
  // 注意此处 needsCompositing 参数为 true
  //
  paintingContext.pushClipRect(true, Offset.zero, Rect.fromCenter(center: Offset(500, 400), width: 200, height: 200), _painter,);

  Paint circle3Paint= Paint();
  circle3Paint.color = Colors.yellow;

  // 再次画一个⭕️
  //
  paintingContext.canvas.drawCircle(Offset(400, 800), 300, circle3Paint);
  paintingContext.stopRecordingIfNeeded();

  // 绘制结束，生成Picture
  //
  Picture picture = recorder.endRecording();

  SceneBuilder sceneBuilder = SceneBuilder();
  sceneBuilder.pushOffset(0, 0);
  // 将 picture 送入 SceneBuilder
  //
  sceneBuilder.addPicture(Offset(0, 0), picture);
  sceneBuilder.pop();
// 生成 Scene
  //
  Scene scene = sceneBuilder.build();

  window.onDrawFrame = () {
    // 将 scene 送入 Engine 层进行渲染显示
    //
    window.render(scene);
  };
  window.scheduleFrame();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, Widget Function(BuildContext)>{
        SingleChildScrollViewPage.routeName: (BuildContext context) =>
            SingleChildScrollViewPage(),
        ListViewBuilderPage.routeName: (BuildContext context) =>
            ListViewBuilderPage(),
        IVSlowPage.routeName: (BuildContext context) => IVSlowPage(),
        IVBuilderPage.routeName: (BuildContext context) => IVBuilderPage(),
        IVBuilderTablePage.routeName: (BuildContext context) =>
            IVBuilderTablePage(),
        ProceduralGenerationPage.routeName: (BuildContext context) =>
            ProceduralGenerationPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _Foo {
  int foo() => 42;
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  _Foo _bar() => _Foo();

  void _incrementCounter() {

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(width: 200, height: 200, color: Colors.red);

    List<String> datas = [
      "复杂耗时计算时,也会UI也会卡顿",
      "自定义RepaintBoundary",
      "Lazy Performance Demos",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  pushPage(TimeConsumingPage(datas[index]));
                } else if (index == 1) {
                  pushPage(CustomPainterPage(datas[index]));
                } else if (index == 2) {
                  pushPage(LazyPage(datas[index]));
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      datas[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: datas.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void pushPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}