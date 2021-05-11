import 'package:flutter/material.dart';
import 'package:flutterapp/MyApp/Mine/Model/MineModel.dart';

class SettingScreen extends StatelessWidget {
  List<SettingModel> settingList = SettingModel.settingList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        backgroundColor: Color(0xFF4B77B0),
      ),
      body: Container(
        color: Color(0xFFF6F6F6),
        child: ListView.builder(
          itemCount: settingList.length,
          itemBuilder: (BuildContext context, int index) {
            SettingCellType type = settingList[index].type;
            if (type == SettingCellType.empty) {
              return SizedBox(
                height: 10,
              );
            } else if (type == SettingCellType.loginOut) {
              return cellLogin(index);
            } else if (type == SettingCellType.checkVersion) {
              return cellCheckVersion(index);
            }
            return cell(index);
          },
        ),
      ),
    );
  }

  Widget cell(int index) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            settingList[index].title,
            style: TextStyle(fontSize: 16),
          ),
          Icon(Icons.keyboard_arrow_right_sharp)
        ],
      ),
    );
  }

  Widget cellCheckVersion(int index) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            settingList[index].title,
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              Text(
                "1.5.0",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Icon(Icons.keyboard_arrow_right_sharp)
            ],
          )
        ],
      ),
    );
  }

  Widget cellLogin(int index) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: Text(
        settingList[index].title,
        style: TextStyle(fontSize: 16, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}
