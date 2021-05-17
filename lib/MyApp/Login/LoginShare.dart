import 'package:shared_preferences/shared_preferences.dart';

class LoginShare {
  static SharedPreferences prefs;

  void _initAsync() async {
    // App启动时读取Sp数据，需要异步等待Sp初始化完成。
    prefs = await SharedPreferences.getInstance();
  }
}
