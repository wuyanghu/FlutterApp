import 'package:flutter/material.dart';
import 'package:flutterapp/MyApp/Login/Login.dart';
import 'package:flutterapp/MyApp/Login/LoginShare.dart';
import 'package:flutterapp/MyApp/Tabbar/MyHomePage.dart';
import 'package:flutterapp/MyApp/examples/WP2Chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  print("启动1");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State {
  String token;

  @override
  void initState() {
    super.initState();
    loadData();
    LoginShare.getInstance().logOut(() {
      loadData();
    });
  }

  void loadData() async {
    SharedPreferences perferences = await SharedPreferences.getInstance();
    token = perferences.getString("token");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

      home: token == null
          ? Login(
              loginFinish: () {
                print("登录回调刷新");
                loadData();
              },
            )
          : MyHomePage(title: 'Flutter WP Demo Home Page'),
    );
  }
}
