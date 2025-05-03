import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LoginShare {
  static LoginShare? _instance;
  static LoginShare getInstance() {
    if (_instance == null) {
      _instance = LoginShare();
    }
    return _instance!;
  }

  void removeLoginInfo() async {
    SharedPreferences perferences = await SharedPreferences.getInstance();

    perferences.remove("token");
    perferences.remove("phoneNumber");
    print("移除token");
  }

  void saveLoginInfo(Map map, String phone) async {
    SharedPreferences perferences = await SharedPreferences.getInstance();

    perferences.setString("token", map["token"]);
    perferences.setString("accountId", map["accountId"]);
    perferences.setString("phoneNumber", phone);
    perferences.setString("accountName", map["accountName"]);
    perferences.setString("tmpToken", map["tmpToken"]);
  }

  late VoidCallback logoutCallBack;
  void logOut(VoidCallback callback) {
    logoutCallBack = callback;
  }
}
