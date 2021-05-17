import 'package:flutter/material.dart';
import 'package:flutterapp/MyApp/Mine/MineInfo_screen.dart';
import 'package:flutterapp/MyApp/Mine/Model/MineModel.dart';

class WPMine extends StatelessWidget {
  List commonUseList = WPMineModel.commonUseList;
  List mineList = WPMineModel.mineList;

  List<Widget> getCommonUseCellList(BuildContext context) {
    List<Widget> listViews = <Widget>[];
    for (WPMineModel model in commonUseList) {
      listViews.add(cell(model, context));
    }
    return listViews;
  }

  List<Widget> getMineCellList(BuildContext context) {
    List<Widget> listViews = <Widget>[];
    for (WPMineModel model in mineList) {
      listViews.add(cell(model, context));
    }
    listViews.add(Expanded(child: SizedBox()));
    return listViews;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: Color(0xFFF6F6F6),
              body: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Image.asset('assets/bling/me/me_bg.png'),
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
                        padding: EdgeInsets.only(
                            left: 24, top: 29, right: 24, bottom: 10),
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
                              child:
                                  Row(children: getCommonUseCellList(context)),
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
                                  children: getMineCellList(context),
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

  Widget cell(WPMineModel model, BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: () {
              if (model.screen == null) {
                print("跳转页面不存在");
                return;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => model.screen,
                  ));
            },
            child: Column(
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset(model.icon),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  model.title,
                  style: TextStyle(fontSize: 12, color: Color(0xFF333333)),
                )
              ],
            )));
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
                        child: Image.asset("assets/bling/me/me_header.png"),
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
                  Icon(Icons.keyboard_arrow_right)
                ],
              )
            ],
          )),
    );
  }
}
