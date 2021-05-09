import 'package:flutter/widgets.dart';
import 'package:flutterapp/Tabbar/Mine_screen.dart';
import 'package:flutterapp/examples/WP2Chapter.dart';
import 'package:flutterapp/examples/WP3Chapter.dart';
import 'package:flutterapp/examples/WP4Chapter.dart';
import 'package:flutterapp/examples/WP5Chapter.dart';
import 'package:flutterapp/examples/WP6Chapter.dart';
import 'package:flutterapp/examples/WP7Chapter.dart';
import 'package:flutterapp/examples/WP8Chapter.dart';
import 'package:flutterapp/examples/WP9Chapter.dart';

class WPChapterModel {
  WPChapterModel({
    this.navigateScreen,
    this.title = '',
  });

  Widget navigateScreen;
  String title;

  static List<WPChapterModel> homeList = [
    WPChapterModel(
      title: '我的',
      navigateScreen: WPMine(),
    ),
    WPChapterModel(
      title: '2.1计数器应用实例',
      navigateScreen: WP2_1Counter(title: '2.1计数器应用实例'),
    ),
    WPChapterModel(
      title: '2.2.1路由的简单跳转',
      navigateScreen: NewRoute(),
    ),
    WPChapterModel(
      title: '2.2.4路由传值',
      navigateScreen: RouterTestRoute(),
    ),
    WPChapterModel(
      title: '2.2.5命名路由',
      navigateScreen: EchoRoute(),
    ),
    WPChapterModel(
      title: '3.1.6State生命周期',
      navigateScreen: CounterWidget(),
    ),
    WPChapterModel(
      title: '3.2.1 Widget管理自身状态',
      navigateScreen: TapboxA(),
    ),
    WPChapterModel(
      title: '3.2.2 父Widget管理子Widget的状态',
      navigateScreen: ParentWidget(),
    ),
    WPChapterModel(
      title: '3.2.3 混合状态管理',
      navigateScreen: ParentWidgetC(),
    ),
    WPChapterModel(
      title: '3.3文本及样式',
      navigateScreen: TextStyle1(),
    ),
    WPChapterModel(
      title: '4.2线性布局-水平',
      navigateScreen: LineRowLayout(),
    ),
    WPChapterModel(
      title: '4.2线性布局-垂直1',
      navigateScreen: LineColumnLayout(),
    ),
    WPChapterModel(
      title: '4.2线性布局-垂直2',
      navigateScreen: LineColumnLayout2(),
    ),
    WPChapterModel(
      title: '4.2线性布局-垂直3',
      navigateScreen: LineColumnLayout3(),
    ),
    WPChapterModel(
      title: '4.2线性布局-垂直4',
      navigateScreen: LineColumnLayout4(),
    ),
    WPChapterModel(
      title: '4.3弹性布局',
      navigateScreen: FlexLayoutTestRoute(),
    ),
    WPChapterModel(
      title: '4.4流式布局-wrap',
      navigateScreen: FlowLayoutWrap(),
    ),
    WPChapterModel(
      title: '4.4流式布局-flow',
      navigateScreen: FlowLayoutFlow(),
    ),
    WPChapterModel(
      title: '4.5层叠布局-Stack',
      navigateScreen: StackLayoutStack(),
    ),
    WPChapterModel(
      title: '4.5层叠布局-Positioned',
      navigateScreen: StackLayoutPositioned(),
    ),
    WPChapterModel(
      title: '4.6对齐与相对定位（Align)',
      navigateScreen: AlignLayoutPositioned(),
    ),
    WPChapterModel(
      title: '5.1填充（Padding）',
      navigateScreen: PaddingTestRoute(),
    ),
    WPChapterModel(
      title: '5.2.1ConstrainedBox',
      navigateScreen: ConstrainedBoxTest(),
    ),
    WPChapterModel(
      title: '5.3 装饰容器DecoratedBox',
      navigateScreen: DecoratedBoxTest(),
    ),
    WPChapterModel(
      title: '5.4 变换（Transform）',
      navigateScreen: TransformTest(),
    ),
    WPChapterModel(
      title: '5.5 Container',
      navigateScreen: ContainerTest(),
    ),
    WPChapterModel(
      title: '6.2SingleChildScrollView',
      navigateScreen: SingleChildScrollViewTestRoute(),
    ),
    WPChapterModel(
      title: '6.3ListView 默认构造函数',
      navigateScreen: ListViewDefalut(),
    ),
    WPChapterModel(
      title: '6.3ListView.builder',
      navigateScreen: ListViewBuilder(),
    ),
    WPChapterModel(
      title: '6.3ListView.separated',
      navigateScreen: ListViewseparated(),
    ),
    WPChapterModel(
      title: '6.3ListView无限加载列表',
      navigateScreen: InfiniteListView(),
    ),
    WPChapterModel(
      title: '6.3ListView添加固定头',
      navigateScreen: ListVierAddHeader(),
    ),
    WPChapterModel(
      title: '6.3ListView添加固定头2',
      navigateScreen: ListVierAddHeader2(),
    ),
    WPChapterModel(
      title: '7.1 导航返回拦截（WillPopScope）',
      navigateScreen: WillPopScopeTestRoute(),
    ),
    WPChapterModel(
      title: '7.2 数据共享（InheritedWidget）',
      navigateScreen: InheritedWidgetTestRoute(),
    ),
    WPChapterModel(
      title: '7.3 跨组件状态共享（Provider）',
      navigateScreen: ProviderRoute(),
    ),
    WPChapterModel(
      title: '7.4 颜色',
      navigateScreen: NavBarTest(),
    ),
    WPChapterModel(
      title: '7.4 主题',
      navigateScreen: ThemeTestRoute(),
    ),
    WPChapterModel(
      title: '7.5.1 FutureBuilder',
      navigateScreen: FutureBuilderTest(),
    ),
    WPChapterModel(
      title: '7.5.2 StreamBuilder',
      navigateScreen: StreamBuilderTest(),
    ),
    WPChapterModel(
      title: '8.2.1 GestureDetector-点击、双击、长按',
      navigateScreen: GestureDetectorTestRoute(),
    ),
    WPChapterModel(
      title: '8.2.1 GestureDetector-拖动、滑动',
      navigateScreen: DragTest(),
    ),
    WPChapterModel(
      title: '8.2.1 GestureDetector-拖动、滑动-单一方向拖动',
      navigateScreen: DragVerticalTest(),
    ),
    WPChapterModel(
      title: '8.2.1 GestureDetector-缩放',
      navigateScreen: ScaleTestRoute(),
    ),
    WPChapterModel(
      title: '8.2.2 GestureRecognizer-点击时给文本变色',
      navigateScreen: GestureRecognizerTestRoute(),
    ),
    WPChapterModel(
      title: '8.2.3 手势竞争与冲突-竞争',
      navigateScreen: BothDirectionTestRoute(),
    ),
    WPChapterModel(
      title: '8.2.3 手势竞争与冲突-冲突',
      navigateScreen: GestureConflictTestRoute(),
    ),
    WPChapterModel(
      title: '8.2.4 Notification',
      navigateScreen: NotificationRoute(),
    ),
    WPChapterModel(
      title: '9.2.1 动画基本结构',
      navigateScreen: ScaleAnimationRoute(),
    ),
  ];
}
