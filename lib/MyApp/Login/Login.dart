import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/BestUI/app_theme.dart';
import 'package:flutterapp/MyApp/CircleOfFriends/Circle.dart';
import 'package:flutterapp/MyApp/Network/Request.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  String phone = '';
  String psw = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Expanded(child: SizedBox()),
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: InkWell(
                            child: Row(
                              children: [
                                Icon(Icons.language),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 2, bottom: 2),
                                  child: getHoriLine(),
                                ),
                                Text('跟随系统'),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "切换语言",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIos: 1,
                                  backgroundColor: Colors.black45,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }))
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Center(
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset("assets/bling/login/login_logo.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("手机号"),
                        Row(children: [
                          Text(
                            "+86",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                          getHoriLine(),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: getTextField('请输入手机号', (String text) {
                            phone = text;
                          }))
                        ]),
                        line(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "密码",
                          style: TextStyle(fontSize: 16),
                        ),
                        getTextField('请输入密码', (String text) {
                          psw = text;
                        }),
                        line(),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("新用户注册"),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: getHoriLine(),
                            ),
                            Text('忘记密码?')
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, bottom: 20, left: 20, right: 20),
                          child: Center(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      offset: const Offset(4, 4),
                                      blurRadius: 8.0),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Future<Map> res =
                                        LoginRequest.loginAuthPsw(phone, psw);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Circle();
                                    }));

                                    // showDialog(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return AlertDialog(
                                    //         title: Text('提示'),
                                    //         content: Text("内容"),
                                    //         actions: <Widget>[
                                    //           FlatButton(
                                    //             child: Text('确定'),
                                    //             onPressed: () {
                                    //               Navigator.of(context).pop();
                                    //             },
                                    //           ),
                                    //           FlatButton(
                                    //             child: Text('取消'),
                                    //             onPressed: () {
                                    //               Navigator.of(context).pop();
                                    //             },
                                    //           )
                                    //         ],
                                    //       );
                                    //     });
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        '登录',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
                ],
              )),
        ));
  }

  Widget getHoriLine() {
    return Container(
      width: 2,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xFF000000).withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }

  Widget getTextField(String hintText, ValueChanged<String> onChanged) {
    return TextField(
      autofocus: false,
      maxLines: 1,
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: AppTheme.fontName,
        fontSize: 16,
        color: Colors.black,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black26, fontSize: 16)),
    );
  }

  Widget line() {
    return Container(color: Color(0xFFEEEEEE), height: 2);
  }
}
