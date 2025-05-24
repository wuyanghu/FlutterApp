import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyApp/Login/Login.dart';
import 'package:flutter_app/MyApp/Login/LoginShare.dart';
import 'package:flutter_app/MyApp/Tabbar/my_home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leak_detector/leak_detector.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:performance_demo/main.dart';

void main() async {
  // 将 debugPrint 指定为空的执行体, 所以它什么也不做
  debugPrint = (String? message, {int? wrapWidth}) {};

  // await SentryFlutter.init(
  //       (options) {
  //     options.dsn = 'https://example@sentry.io/add-your-dsn-here';
  //   },
  //   // Init your App.
  //   appRunner: () => runApp(MyApp()),
  // );
  runZonedGuarded(() async {
    await SentryFlutter.init((options) {
      options.dsn =
          'https://06005edd867f982d76a48de50f1d6cc7@o4509348600741888.ingest.us.sentry.io/4509348760322048';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
      options.sendDefaultPii = true;
      options.debug = kDebugMode;
      options.attachViewHierarchy = true;

    }, appRunner: () {
      SentryWidgetsFlutterBinding.ensureInitialized();
      return runApp(SentryWidget(
          child: DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: MyApp(),
      )));
    });

    // 捕获同步 Flutter 错误
    FlutterError.onError = (FlutterErrorDetails details) {
      Sentry.captureException(details.exception, stackTrace: details.stack);
    };
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
  // runApp(MyApp());
}

void main_dev() {
  Provider.debugCheckInvalidValueType = null;

  // 将 debugPrint 指定为同步打印数据
  debugPrint = (String? message, {int? wrapWidth}) =>
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
  String? token;

  @override
  void initState() {
    super.initState();
    LeakDetector().init(maxRetainingPath: 300);
    //show preview page
    LeakDetector().onLeakedStream.listen((LeakedInfo info) {
      //print to console
      info.retainingPath.forEach((node) => print(node));
      //show preview page
      showLeakedInfoPage(context, info);
    });

    WidgetsBinding.instance.addObserver(this); // 注册监听器

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
      return UnknownPage();
    };
    return MultiProvider(
        providers: [
          Provider.value(value: 30.0), // 注入字体大小
          // ChangeNotifierProvider.value(value: CounterModel()) // 注入计数器实例
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '应用名称',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          navigatorObservers: [
            SentryNavigatorObserver(setRouteNameAsTransaction: true),
            LeakNavigatorObserver(
              //返回false则不会校验这个页面.
              shouldCheck: (route) {
                return route.settings.name != null &&
                    route.settings.name != '/';
              },
            ),
          ],
          //注册路由表
          routes: PerformanceApp.routes,
          onUnknownRoute: (RouteSettings setting) =>
              MaterialPageRoute(builder: (context) {
            return UnknownPage(); //统一处理没有生效,不是没有生效
          }),

          // onGenerateRoute: (RouteSettings settings) {
          //   return MaterialPageRoute(builder: (context) {
          //     String? routeName = settings.name;
          //     if (routeName == null) {
          //       return "/";
          //     }
          //     return "";
          //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          //     // 引导用户登录；其它情况则正常打开路由。
          //   });
          // },

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
