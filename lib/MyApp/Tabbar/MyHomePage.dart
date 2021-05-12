import 'package:flutter/material.dart';
import 'package:flutterapp/BestUI/navigation_home_screen.dart';
import 'package:flutterapp/MyApp/Tabbar/FlutterMarkdown.dart';
import 'package:flutterapp/MyApp/LeftDrawer/LeftDrawer.dart';
import 'package:flutterapp/MyApp/Mine/Mine_screen.dart';
import 'package:flutterapp/MyApp/examples/WPChapters_screen.dart';
import 'package:flutterapp/DouBan/pages/container_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;

  List tabs = ["flutter实战demo", "MarkDown解析"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          print("1_0");
          break;
        case 1:
          print("1_1");
          break;
        case 2:
          print("1_2");
          break;
      }
    });
  }

  Widget getAppBar() {
    if (_selectedIndex == 0) {
      return AppBar(
        //导航栏
        title: Text("首页"),
        bottom: TabBar(
            //生成Tab菜单
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

  Widget getBody() {
    if (_selectedIndex == 0) {
      return TabBarView(
          controller: _tabController, children: getSelectContainer());
    } else if (_selectedIndex == 1) {
      return ContainerPage();
    } else if (_selectedIndex == 2) {
      return NavigationHomeScreen();
    }
    return WPMine();
  }

  List getSelectContainer() {
    return tabs.map((e) {
      //创建3个Tab页
      if (e == tabs[0]) {
        return WPChaters();
      } else if (e == tabs[1]) {
        return FlutterMarkdown();
      }

      return Container(
        alignment: Alignment.center,
        child: Text(e, textScaleFactor: 5),
      );
    }).toList();
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'DouBan'),
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
    return Scaffold(
      appBar: getAppBar(),
      drawer: LeftDrawer(), //抽屉
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: (() {
      //       var now = new DateTime.now();
      //       print(now.millisecondsSinceEpoch); //单位毫秒，13位时间戳
      //     })),
    );
  }
}
