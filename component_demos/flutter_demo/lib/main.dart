import 'dart:io';

import 'package:flutter_demo/%E7%BB%98%E5%88%B6/renderobject_paint/done_widget.dart';
import 'package:flutter_demo/provider/Chapter7/shopping.dart';
import 'package:flutter_demo/绘制/renderobject_paint/custom_checkbox_page.dart';
import 'package:flutter_demo/绘制/custom_paint/custom_paint_page.dart';
import 'package:flutter_demo/绘制/custom_paint/gradient_circular_progress_indicator_page.dart';
import 'package:flutter_demo/绘制/custom_paint/turn_box_page.dart';
import 'package:flutter_demo/provider/Chapter7/share_data_widget.dart';
import 'package:flutter_demo/provider/provider_demo.dart';
import 'package:flutter_demo/provider/share_provider_page.dart';
import 'package:flutter_demo/status_manager/bloc_demo/bloc_demo_page.dart';
import 'package:flutter_demo/status_manager/bloc_demo/bloc_example.dart';
import 'package:flutter_demo/status_manager/get/get_page.dart';
import 'package:flutter_demo/switch/switch_demo.dart';
import 'package:flutter_demo/tab_demo/tab_demo.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:isolate';
import 'animations/custom_hero_page.dart';
import 'animations/custom_route_animation.dart';
import 'animations/flutter_hero_page.dart';
import 'animations/scale_animation1_page.dart';
import 'animations/scale_animation2_page.dart';
import 'animations/scale_animation_page.dart';
import 'animations/stagger_animation_page.dart';
import 'flutter_实战/WPChapters_screen.dart';
import 'slider/symmetric_slider_demo.dart';
import 'package:leak_detector/leak_detector.dart';

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

  int _fibonacci(int n) {
    for (int i = 0; i < n; i++) {}
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildItem(String title, Widget? body, {VoidCallback? onTap}) {
      return GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!.call();
              return;
            }
            Navigator.push(context, MaterialPageRoute(builder: (_) => body!));
          },
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ));
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
          Divider(
            indent: 1,
          ),
          _buildItem("flutter实战", WPChaters()),
          Divider(
            indent: 1,
          ),
          _buildItem(
            '7.2 数据共享（InheritedWidget）',
            InheritedWidgetTestRoute(),
          ),
          _buildItem(
            '7.3 跨组件状态共享（Provider）',
            ProviderRoute(),
          ),
          _buildItem("provider_demo", ProviderDemo()),
          _buildItem("ShareProviderPage", ShareProviderPage()),
          _buildItem("bloc_demo", BlocDemoPage()),
          _buildItem("bloc_官方demo", BlocExample()),
          _buildItem("get_demo", GetPage()),
          Divider(
            indent: 1,
          ),
          _buildItem("CustomPaint_五子棋/盘", CustomPaintPage()),
          _buildItem("GradientCircularProgressRoute_绘制",
              GradientCircularProgressPage()),
          _buildItem("TurnBoxRoute", TurnBoxPage()),
          _buildItem("CustomCheckboxPage", CustomCheckboxPage()),
          _buildItem("DonePage", DonePage()),
          Divider(
            indent: 1,
          ),
          _buildItem(
              "scale animation",
              ScaleAnimationRoute(
                key: UniqueKey(),
              )),
          _buildItem("scale1 AnimatedImage", ScaleAnimationRoute1()),
          _buildItem("scale2 AnimatedBuilder", ScaleAnimationRoute2()),
          _buildItem(
              "自定义路由 animation",
              CustomRouteAnimation(
                count: 0,
              )),
          _buildItem("CustomHeroAnimation", CustomHeroAnimation()),
          _buildItem(
              "FlutterHeroAnimation",
              HeroAnimationRouteA(
                key: UniqueKey(),
              )),
          _buildItem("StaggerRoute", StaggerRoute()),
          Divider(
            indent: 1,
          ),
          _buildItem("slider_demo", SymmetricSliderDemo()),
          _buildItem("switch_demo", SwitchDemo()),
          _buildItem("tab_异常_demo", TabDemo()),
          Divider(
            indent: 1,
          ),
          _buildItem("事件任务、微任务优先级", null, onTap: () {
            EventLoop().task();
          }),
          _buildItem("compute()开启Isolate", null, onTap: () {
            IsolateExample().computeExample();
          }),
          _buildItem("开启Isolate2", null, onTap: () {
            IsolateExample().startIsolate();
            IsolateExample().asyncFactorialiMain();
            IsolateExample().asyncFactorialiMain2();
          }),
          _buildItem("内存泄漏记录", null, onTap: () {
            getLeakedRecording().then((List<LeakedInfo> infoList) {
              showLeakedInfoListPage(context, infoList);
            });
          }),
          Divider(
            indent: 1,
          ),
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
