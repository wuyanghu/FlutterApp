import 'package:flutter/material.dart';
import 'package:flutterapp/Tabbar/FlutterMarkdown.dart';
import 'package:flutterapp/LeftDrawer/LeftDrawer.dart';
import 'package:flutterapp/Mine/Mine_screen.dart';
import 'package:flutterapp/examples/WP6Chapter.dart';
import 'package:flutterapp/examples/WPChapters_screen.dart';

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
    }
    return WPMine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),

      drawer: LeftDrawer(), //抽屉
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Me')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton:
      //     FloatingActionButton(child: Icon(Icons.add), onPressed: _onAdd),
    );
  }

  void _onAdd() {
    var now = new DateTime.now();
    print(now.millisecondsSinceEpoch); //单位毫秒，13位时间戳
  }

  List getSelectContainer() {
    return tabs.map((e) {
      if (_selectedIndex == 1) {
        return WPMine();
      }
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
}
