import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MyApp/Login/Login.dart';
import 'package:flutterapp/MyApp/Login/LoginShare.dart';
import 'package:flutterapp/MyApp/Tabbar/MyHomePage.dart';
import 'package:flutterapp/MyApp/examples/WP2Chapter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'MyApp/examples2/Extends.dart';
import 'MyApp/examples2/FutureExample.dart';
import 'MyApp/examples2/InheritedWidget.dart';
import 'MyApp/examples2/Provider.dart';
import 'MyApp/examples/Chapter7/Shopping.dart';

void main() {
  // 将 debugPrint 指定为空的执行体, 所以它什么也不做
  debugPrint = (String message, {int wrapWidth}) {};

  runApp(MyApp());
}

void main_dev() {
  Provider.debugCheckInvalidValueType = null;

  // 将 debugPrint 指定为同步打印数据
  debugPrint = (String message, {int wrapWidth}) =>
      debugPrintSynchronously(message, wrapWidth: wrapWidth);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State with WidgetsBindingObserver {
  String token;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // 注册监听器

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //build之后的一次回调
      print(" 单次 Frame 绘制回调 "); // 只回调一次
    });

    //只要有build就会回调，动画调用最多
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      print(" 实时 Frame 绘制回调 "); // 每帧都回调
    });

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
    print("build");
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return getErrorWidget(context, errorDetails);
    };
    return MultiProvider(
        providers: [
          Provider.value(value: 30.0), // 注入字体大小
          ChangeNotifierProvider.value(value: CounterModel()) // 注入计数器实例
        ],
        child: MaterialApp(
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
            "ProviderExample": (context) => ProviderExample(),
            "MyProvider_SecondPage": (context) => SecondPage(),
            "FutureExample": (context) => FutureExample(),
            "/ProviderRoute": (context) => ProviderRoute(),
            "CustomInheritedWidget": (context) => CustomInheritedWidget(),
            // "StatefulWidget1": (context) => StatefulWidget1(),
            // "StatefulWidget2": (context) => StatefulWidget2()
          },
          onUnknownRoute: (RouteSettings setting) =>
              MaterialPageRoute(builder: (context) {
            return UnknownPage(); //统一处理没有生效,不是没有生效
          }),

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
        ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print("$state");
    if (state == AppLifecycleState.resumed) {
      print("进入前台");
    } else if (state == AppLifecycleState.inactive) {
      print("进入后台");
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); // 移除监听器
  }

  Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
    return UnknownPage();
  }
}

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: Colors.red,
          child: Center(
            child: Text(
              "错误页面",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          print("发生异常了，点击我重新初始化");
        },
      ),
    );
  }
}
