import 'package:flutter/material.dart';
import 'package:flutter_app/BestUI/navigation_home_screen.dart';
import 'package:flutter_app/MyApp/LeftDrawer/LeftDrawer.dart';
import 'package:flutter_app/MyApp/Mine/mine_page.dart';
import 'package:flutter_demo/main.dart';
import 'package:performance_demo/main.dart';
import 'package:leak_detector/leak_detector.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  List tabs = ["flutter实战demo", "性能优化"];

  @override
  void initState() {
    super.initState();
    // LeakDetector().init(maxRetainingPath: 300);
    // //show preview page
    // LeakDetector().onLeakedStream.listen((LeakedInfo info) {
    //   //print to console
    //   info.retainingPath.forEach((node) => print(node));
    //   //show preview page
    //   showLeakedInfoPage(context, info);
    // });

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          print("1_0");
          break;
        case 1:
          print("1_1");
          break;
      }
    });
  }

  PreferredSizeWidget? _buildAppBarWidget() {
    if (_selectedIndex == 0) {
      return AppBar(
        //导航栏
        title: Text("首页"),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              });
        }),
        actions: <Widget>[
          //导航栏右侧菜单:分享
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }),
        ],
      );
    }
    return null;
  }

  Widget _buildBodyWidget() {
    if (_selectedIndex == 0) {
      return TabBarView(
          controller: _tabController, children: _buildTabWidget());
    } else if (_selectedIndex == 1) {
      return NavigationHomeScreen();
    }
    return WPMine();
  }

  List<Widget> _buildTabWidget() {
    return tabs.map<Widget>((e) {
      //创建3个Tab页
      if (e == tabs[0]) {
        return FlutterDemoHomePage(
          title: 'flutter demo',
          hideAppBar: true,
        );
      }

      return PerformanceApp(isMaterialApp: false);
    }).toList();
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'BestUI'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      // showUnselectedLabels: true,
      // fixedColor: Colors.blue,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("MyHomePage build");
    return Scaffold(
      appBar: _buildAppBarWidget(),
      drawer: LeftDrawer(), //抽屉
      body: _buildBodyWidget(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }
}
