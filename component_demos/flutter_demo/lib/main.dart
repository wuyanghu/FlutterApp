import 'package:flutter_demo/%E7%BB%98%E5%88%B6/renderobject_paint/done_widget.dart';
import 'package:flutter_demo/memory_example/leak_single_child_view_page.dart';
import 'package:flutter_demo/memory_example/load_img_page.dart';
import 'package:flutter_demo/memory_example/memory_leak_time_page.dart';
import 'package:flutter_demo/provider/Chapter7/shopping.dart';
import 'package:flutter_demo/memory_example/memory_leak_big_page.dart';
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
import 'async_example/future_example.dart';
import 'async_example/stream_example.dart';
import 'flutter_实战/WPChapters_screen.dart';
import 'memory_example/memory_leak_buildcontext_page.dart';
import 'memory_example/memory_leak_file_read_page.dart';
import 'memory_example/memory_leak_scale_animiation_page.dart';
import 'slider/symmetric_slider_demo.dart';
import 'package:leak_detector/leak_detector.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_demo/video_player.dart';

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

Map<String, WidgetBuilder> getFlutterDemoRoutes() {
  Map<String, WidgetBuilder> routes = <String, Widget Function(BuildContext)>{
    WPChaters.route: (BuildContext context) => WPChaters(),
    InheritedWidgetTestRoute.route: (BuildContext context) =>
        InheritedWidgetTestRoute(),
    ProviderRoute.route: (BuildContext context) => ProviderRoute(),
    ProviderDemo.route: (BuildContext context) => ProviderDemo(),
    ShareProviderPage.route: (BuildContext context) => ShareProviderPage(),
    BlocDemoPage.route: (BuildContext context) => BlocDemoPage(),
    BlocExample.route: (BuildContext context) => BlocExample(),
    GetPage.route: (BuildContext context) => GetPage(),
    CustomPaintPage.route: (BuildContext context) => CustomPaintPage(),
    GradientCircularProgressPage.route: (BuildContext context) =>
        GradientCircularProgressPage(),
    TurnBoxPage.route: (BuildContext context) => TurnBoxPage(),
    CustomCheckboxPage.route: (BuildContext context) => CustomCheckboxPage(),
    DonePage.route: (BuildContext context) => DonePage(),
    CustomPaintPage.route: (BuildContext context) => CustomPaintPage(),
    GradientCircularProgressPage.route: (BuildContext context) =>
        GradientCircularProgressPage(),
    TurnBoxPage.route: (BuildContext context) => TurnBoxPage(),
    CustomCheckboxPage.route: (BuildContext context) => CustomCheckboxPage(),
    DonePage.route: (BuildContext context) => DonePage(),
    ScaleAnimationRoute.route: (BuildContext context) => ScaleAnimationRoute(),
    ScaleAnimationRoute1.route: (BuildContext context) =>
        ScaleAnimationRoute1(),
    ScaleAnimationRoute2.route: (BuildContext context) =>
        ScaleAnimationRoute2(),
    CustomHeroAnimation.route: (BuildContext context) => CustomHeroAnimation(),
    BigMemoryPage.route: (BuildContext context) => BigMemoryPage(),
    LoadImgPage.route: (BuildContext context) => LoadImgPage(),
    MemoryLeakTimePage.route: (BuildContext context) => MemoryLeakTimePage(),
    LeakSingleChildViewPage.route: (BuildContext context) =>
        LeakSingleChildViewPage(),
    MemoryLeakBuildcontextPage.route: (BuildContext context) =>
        MemoryLeakBuildcontextPage(),
    MemoryLeakScaleAnimationPage.route: (BuildContext context) =>
        MemoryLeakScaleAnimationPage(),
    MemoryLeakScrollControllerPage.route: (BuildContext context) =>
        MemoryLeakScrollControllerPage(),
    VideoPlayerPage.route: (BuildContext context) => VideoPlayerPage(),
    MemoryLeakFileReadPage.route: (BuildContext context) =>
        MemoryLeakFileReadPage(),
    StreamExample.route: (BuildContext context) => StreamExample(),
    FutureExample.route: (BuildContext context) => FutureExample(),
  };

  return routes;
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
    Widget _buildItem(
      String title, {
      String? routeName,
      Object? arguments,
      VoidCallback? onTap,
    }) {
      return GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap.call();
              return;
            } else if (routeName != null) {
              Navigator.pushNamed(context, routeName, arguments: arguments);
              return;
            }
          },
          child: SizedBox(
            height: 25,
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
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
          _buildItem("flutter实战", routeName: WPChaters.route),
          Divider(
            indent: 1,
          ),
          _buildItem(
            '7.2 数据共享（InheritedWidget）',
            routeName: InheritedWidgetTestRoute.route,
          ),
          _buildItem(
            '7.3 跨组件状态共享（Provider）',
            routeName: ProviderRoute.route,
          ),
          _buildItem("provider_demo", routeName: ProviderDemo.route),
          _buildItem("ShareProviderPage", routeName: ShareProviderPage.route),
          _buildItem("bloc_demo", routeName: BlocDemoPage.route),
          _buildItem("bloc_官方demo", routeName: BlocExample.route),
          _buildItem("get_demo", routeName: GetPage.route),
          Divider(
            indent: 1,
          ),
          _buildItem("CustomPaint_五子棋/盘", routeName: CustomPaintPage.route),
          _buildItem("GradientCircularProgressRoute_绘制",
              routeName: GradientCircularProgressPage.route),
          _buildItem("TurnBoxRoute", routeName: TurnBoxPage.route),
          _buildItem("CustomCheckboxPage", routeName: CustomCheckboxPage.route),
          _buildItem("DonePage", routeName: DonePage.route),
          Divider(
            indent: 1,
          ),
          _buildItem(
            "scale animation",
            routeName: ScaleAnimationRoute.route,
          ),
          _buildItem("scale1 AnimatedImage",
              routeName: ScaleAnimationRoute1.route),
          _buildItem("scale2 AnimatedBuilder",
              routeName: ScaleAnimationRoute2.route),
          _buildItem("自定义路由 animation",
              routeName: CustomRouteAnimation.route, arguments: 0),
          _buildItem("CustomHeroAnimation",
              routeName: CustomHeroAnimation.route),
          _buildItem("FlutterHeroAnimation",
              routeName: HeroAnimationRouteA.route),
          _buildItem("StaggerRoute", routeName: StaggerRoute.route),
          Divider(
            indent: 1,
          ),
          _buildItem("slider_demo", routeName: SymmetricSliderDemo.route),
          _buildItem("switch_demo", routeName: SwitchDemo.route),
          _buildItem("tab_异常_demo", routeName: TabDemo.route),
          Divider(
            indent: 1,
          ),
          _buildItem("Future探究", routeName: FutureExample.route),
          _buildItem(
            "stream",
            routeName: StreamExample.route,
          ),
          _buildItem("compute()开启Isolate", onTap: () {
            IsolateExample().computeExample();
          }),
          _buildItem("开启Isolate2", onTap: () {
            IsolateExample().startIsolate();
            // IsolateExample().asyncFactorialiMain();
            // IsolateExample().asyncFactorialiMain2();
          }),
          _buildItem("compute()开启Isolate", onTap: () {
            IsolateExample().computeExample();
          }),
          Divider(
            indent: 1,
          ),
          _buildItem("内存泄漏记录列表", onTap: () {
            getLeakedRecording().then((List<LeakedInfo> infoList) {
              showLeakedInfoListPage(context, infoList);
            });
          }),
          _buildItem("内存泄漏-大内存", routeName: BigMemoryPage.route),
          _buildItem("内存泄漏-图片", routeName: LoadImgPage.route),
          _buildItem("内存泄漏-time", routeName: MemoryLeakTimePage.route),
          _buildItem("内存泄漏-singleChildView",
              routeName: LeakSingleChildViewPage.route),
          _buildItem("内存泄漏-bildContext",
              routeName: MemoryLeakBuildcontextPage.route),
          _buildItem("内存泄漏-AnimationController",
              routeName: MemoryLeakScaleAnimationPage.route),
          _buildItem("内存泄漏-scrollController no dispose",
              routeName: MemoryLeakScrollControllerPage.route),
          _buildItem("内存泄漏-文件分片内存泄漏", routeName: MemoryLeakFileReadPage.route),
          Divider(
            indent: 1,
          ),
          _buildItem("Sentry 读取本地json监控", onTap: () async {
            final transaction = Sentry.startTransaction(
              'asset-bundle-transaction-1',
              'load',
              bindToScope: true,
            );
            final text = await DefaultAssetBundle.of(context)
                .loadString('assets/markdown.md');
            await transaction.finish(status: const SpanStatus.ok());
          }),
          _buildItem("video_player播放", routeName: VideoPlayerPage.route)
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
