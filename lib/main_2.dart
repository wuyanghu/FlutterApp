import 'package:flutter/material.dart';
import 'package:flutterapp/MyApp/Tabbar/MyHomePage.dart';
import 'package:flutterapp/MyApp/examples/WP2Chapter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '应用名称',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //注册路由表
      routes: {
        "NewRoute": (context) => NewRoute(),
        "RouterTestRoute": (context) => RouterTestRoute(),
        "CupertinoTestRoute": (context) => CupertinoTestRoute(),
        // "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
        });
      },

      home: MyHomePage(title: 'Flutter WP Demo Home Page'),
    );
  }
}
