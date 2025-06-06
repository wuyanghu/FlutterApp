import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class HeroAnimationRouteA extends StatelessWidget {
  static String route = 'HeroAnimationRouteA';

  const HeroAnimationRouteA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildScaffold(
        "flutter hero",
        Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              InkWell(
                child: Hero(
                  tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                  child: ClipOval(
                    child: Image.asset(
                      "assets/bling/me/me_header.png",
                      width: 50.0,
                    ),
                  ),
                ),
                onTap: () {
                  //打开B路由
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context,
                      animation,
                      secondaryAnimation,
                    ) {
                      return FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          appBar: AppBar(
                            title: const Text("原图"),
                          ),
                          body: HeroAnimationRouteB(),
                        ),
                      );
                    },
                  ));
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("点击头像"),
              )
            ],
          ),
        ));
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("assets/bling/me/me_header.png"),
      ),
    );
  }
}
