import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/BestUI/app_theme.dart';
import 'package:flutterapp/MyApp/Help/Network/Request.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  VoidCallback loginFinish;
  Login({this.loginFinish});
  @override
  State<StatefulWidget> createState() {
    return _Login(loginFinish: loginFinish);
  }
}

class _Login extends State<Login> {
  String phone = '';
  String psw = '';
  VoidCallback loginFinish;
  bool autofocus;
  _Login({this.loginFinish, this.autofocus = false});

  @override
  void initState() {
    super.initState();
    print("initState");
    initAsync();
  }

  void initAsync() async {
    SharedPreferences perferences = await SharedPreferences.getInstance();
    String phoneNumebr = perferences.getString("phoneNumber");
    setState(() {
      if (phoneNumebr != null) {
        phone = phoneNumebr;
      }
    });
    print("initAsync");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
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
                                  child: horiLine(),
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
                          horiLine(),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: getTextField(
                                  '请输入手机号',
                                  phone.length == 0 ? "" : phone,
                                  autofocus, (String text) {
                            setState(() {
                              phone = text;
                            });
                          }))
                        ]),
                        verticalLine(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "密码",
                          style: TextStyle(fontSize: 16),
                        ),
                        getTextField('请输入密码', "", autofocus, (String text) {
                          setState(() {
                            psw = text;
                          });
                        }),
                        verticalLine(),
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
                              child: horiLine(),
                            ),
                            Text('忘记密码?')
                          ],
                        ),
                        loginBtn()
                      ])),
                ],
              )),
        ));
  }

  Widget getTextField(String hintText, String text, bool autofocus,
      ValueChanged<String> onChanged) {
    return TextField(
      autofocus: autofocus,
      maxLines: 1,
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: AppTheme.fontName,
        fontSize: 16,
        color: Colors.black,
      ),
      cursorColor: Colors.blue,
      decoration: text.length > 0
          ? InputDecoration(
              border: InputBorder.none,
              labelText: text,
              labelStyle: TextStyle(color: Colors.black, fontSize: 16))
          : InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black26, fontSize: 16)),
    );
  }

  Widget loginBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 20, left: 20, right: 20),
      child: Center(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: isEmpty() ? Colors.grey : Colors.blue,
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
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
                if (isEmpty()) {
                  Fluttertoast.showToast(
                      msg: "用户名密码不能为空", gravity: ToastGravity.CENTER);
                  return;
                }

                LoginRequest.loginAuthPsw(phone, psw).then((value) {
                  if (value == null) {
                    return;
                  }
                  if (loginFinish != null) {
                    loginFinish();
                  }
                });
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
    );
  }

  bool isEmpty() {
    return (phone.length == 0 || psw.length == 0);
  }

  Widget horiLine() {
    return Container(
      width: 2,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xFF000000).withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }

  Widget verticalLine() {
    return Container(color: Color(0xFFEEEEEE), height: 2);
  }
}
