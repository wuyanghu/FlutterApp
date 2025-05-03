import 'package:flutter/material.dart';

class WPMineInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            top: false,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF4B77B0),
                title: Text("个人信息"),
              ),
              backgroundColor: Color(0xFFF6F6F6),
              body: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("头像", style: TextStyle(fontSize: 16)),
                        Row(
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child:
                                  Image.asset("assets/bling/me/me_header.png"),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        )
                      ],
                    ),
                  ),
                  line(),
                  cell("昵称", "某非著名程序员"),
                  line(),
                  cell("手机号", "15658026793"),
                  line(),
                  cell("BLing ID", "uid_8129823ad132"),
                  line(),
                  cell("我的二维码", ""),
                  SizedBox(
                    height: 20,
                  ),
                  cell("性别", "男"),
                  line(),
                  cell("出生日期", "未设置"),
                ],
              ),
            )));
  }

  Widget line() {
    return Container(
      height: 1,
      color: Color(0xFFF6F6F6),
    );
  }

  Widget cell(String title, String subTitle) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Text(subTitle, style: TextStyle(fontSize: 14)),
                Icon(Icons.keyboard_arrow_right)
              ],
            )
          ],
        ));
  }
}
