import 'package:flutter/material.dart';
import 'package:flutter_app/BestUI/navigation_home_screen.dart';
import 'package:flutter_app/MyApp/CircleOfFriends/circle_page.dart';
import 'package:flutter_app/MyApp/Mine/setting_page.dart';
import 'package:flutter_app/MyApp/Thinking/Thinking.dart';

typedef ScreenCallback = Widget Function();

class WPMineModel {
  WPMineModel({
    required this.icon,
    this.title = '',
    this.screenCall,
    this.routeName,
  });

  String icon;
  String title;
  String? routeName;

  ScreenCallback? screenCall;
}

enum SettingCellType { normal, checkVersion, loginOut, empty }

class SettingModel {
  String title;
  SettingCellType type;
  SettingModel({this.title = "", this.type = SettingCellType.normal});

  static List<SettingModel> settingList = [
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "账号与安全"),
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "新消息通知"),
    SettingModel(title: "勿扰模式"),
    SettingModel(title: "隐私"),
    SettingModel(title: "通用"),
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "检查新版本", type: SettingCellType.checkVersion),
    SettingModel(type: SettingCellType.empty),
    SettingModel(title: "退出登录", type: SettingCellType.loginOut),
  ];
}
