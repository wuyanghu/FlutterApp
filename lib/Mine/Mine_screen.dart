import 'package:flutter/material.dart';
import 'package:flutterapp/Mine/MineInfo_screen.dart';

class WPMine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: Colors.grey,
              body: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Image.asset('images/me_bg.png'),
                ),
                headInfo(context),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: 14,
                            right: 14,
                            top: MediaQuery.of(context).padding.top + 56),
                        child: card(context)),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: Container(
                        padding: EdgeInsets.only(left: 24, top: 29),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "常用",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Row(children: [
                                cell("images/me_icon_fangyi@3x.png", "疫情助手"),
                                cell("images/me_icon_invite@3x.png", "邀请"),
                                cell("images/me_icon_downloadapp@3x.png",
                                    "下载app"),
                                cell("images/me_icon_setting@3x.png", "设置"),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 41),
                              child: Text(
                                "我的",
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 18),
                                child: Row(
                                  children: [
                                    cell("images/me_icon_circle@3x.png", "朋友圈"),
                                    cell("images/me_icon_home@3x.png", "个人主页"),
                                    cell("images/me_icon_collect@3x.png", "收藏"),
                                    Expanded(child: SizedBox())
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ))
                  ],
                )
              ]),
            )));
  }

  Widget cell(String path, String title) {
    return Expanded(
        child: Column(
      children: [
        Container(
          width: 25,
          height: 25,
          child: Image.asset(path),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Color(0xFF333333)),
        )
      ],
    ));
  }

  Widget headInfo(BuildContext context) {
    return Container(
      height: 178,
      child: Padding(
          padding: EdgeInsets.only(
              left: 15, right: 15, top: MediaQuery.of(context).padding.top),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                "我的",
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
              Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onTap: () {
                      print("搜索");
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Icon(Icons.add, color: Colors.white),
                    onTap: () {
                      print("添加");
                    },
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget card(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
          color: Colors.white,
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(left: 24, right: 24, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "张三",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "BLing ID:uid_9281c0912f23f5er",
                            style: TextStyle(
                                color: Color(0xFF000000), fontSize: 14),
                          )
                        ],
                      )),
                      SizedBox(
                        width: 55,
                        height: 55,
                        child: Image.asset("images/me_header.png"),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  print("个人信息");

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WPMineInfo();
                  }));
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 26),
                child: Container(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 9, bottom: 9, left: 24),
                    child: Text(
                      "办公名片",
                      style: TextStyle(fontSize: 14, color: Color(0xFF000000)),
                    ),
                  )),
                  Icon(Icons.arrow_right)
                ],
              )
            ],
          )),
    );
  }
}
