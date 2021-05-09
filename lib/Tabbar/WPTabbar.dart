import 'package:flutter/material.dart';
import 'package:flutterapp/Tabbar/FlutterMarkdown.dart';
import 'package:flutterapp/LeftDrawer/LeftDrawer.dart';
import 'package:flutterapp/Mine/Mine_screen.dart';
import 'package:flutterapp/examples/WP6Chapter.dart';
import 'package:flutterapp/examples/WPChapters_screen.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;

  List tabs = ["学习列表", "历史", "学习"];
  List tabs1 = ["新闻1", "图片1", "学习1"];
  List tabs2 = ["新闻2", "图片2", "学习2"];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("首页"),
        bottom: TabBar(
            //生成Tab菜单
            controller: getSelectTabController(),
            tabs: getSelectTab()),
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
      ),

      drawer: new LeftDrawer(), //抽屉
      body: TabBarView(
          controller: getSelectTabController(), children: getSelectContainer()),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      //悬浮按钮
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {
    var now = new DateTime.now();
    print(now.millisecondsSinceEpoch); //单位毫秒，13位时间戳
  }

  List getSelectContainer() {
    List _tabs;
    if (_selectedIndex == 0) {
      _tabs = tabs;
    } else if (_selectedIndex == 1) {
      _tabs = tabs1;
    } else {
      _tabs = tabs2;
    }

    return _tabs.map((e) {
      //创建3个Tab页
      if (e == tabs[0]) {
        return WPMine();
      } else if (e == tabs[1]) {
        return WPChaters();
      }

      if (e == tabs1[0]) {
        return FlutterMarkdown();
      }

      if (e == tabs2[0]) {
        return Mine();
      }

      return Container(
        alignment: Alignment.center,
        child: Text(e, textScaleFactor: 5),
      );
    }).toList();
  }

  TabController getSelectTabController() {
    return _tabController;
  }

  List<Tab> getSelectTab() {
    if (_selectedIndex == 0) {
      return tabs.map((e) => Tab(text: e)).toList();
    } else if (_selectedIndex == 1) {
      return tabs1.map((e) => Tab(text: e)).toList();
    } else {
      return tabs2.map((e) => Tab(text: e)).toList();
    }
  }
}
