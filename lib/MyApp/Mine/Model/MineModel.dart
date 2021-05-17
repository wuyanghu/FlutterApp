import 'package:flutter/material.dart';
import 'package:flutterapp/BestUI/navigation_home_screen.dart';
import 'package:flutterapp/MyApp/Login/Login.dart';
import 'package:flutterapp/MyApp/Mine/Setting_screen.dart';
import 'package:flutterapp/main.dart';

class WPMineModel {
  WPMineModel({this.icon, this.title = '', this.screen});

  String icon;
  String title;
  Widget screen;

  static List<WPMineModel> commonUseList = [
    WPMineModel(
        icon: "assets/bling/me/me_icon_fangyi@3x.png",
        title: "疫情助手",
        screen: MyApp()),
    WPMineModel(
        icon: "assets/bling/me/me_icon_invite@3x.png",
        title: "邀请",
        screen: NavigationHomeScreen()),
    WPMineModel(
        icon: "assets/bling/me/me_icon_downloadapp@3x.png", title: "下载app"),
    WPMineModel(
        icon: "assets/bling/me/me_icon_setting@3x.png",
        title: "设置",
        screen: SettingScreen()),
  ];

  static List<WPMineModel> mineList = [
    WPMineModel(
        icon: "assets/bling/me/me_icon_circle@3x.png",
        title: "朋友圈",
        screen: Login()),
    WPMineModel(icon: "assets/bling/me/me_icon_home@3x.png", title: "个人主页"),
    WPMineModel(icon: "assets/bling/me/me_icon_collect@3x.png", title: "收藏"),
  ];
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
