import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/scaffold_mixin.dart';

class CustomRouteAnimation extends StatefulWidget {
  static String route = 'CustomRouteAnimation';

  final int count;
  const CustomRouteAnimation({super.key, required this.count});

  @override
  State<CustomRouteAnimation> createState() => _CustomRouteAnimationState();
}

class _CustomRouteAnimationState extends State<CustomRouteAnimation> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold(
        "自定义路由动画${widget.count}",
        Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            CustomRouteAnimation(count: widget.count + 1),
                      ));
                },
                child: Text("CupertinoPageRoute push")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration:
                            Duration(milliseconds: 500), //动画时间为500毫秒
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation secondaryAnimation) {
                          return FadeTransition(
                            //使用渐隐渐入过渡,
                            opacity: animation,
                            child: CustomRouteAnimation(
                                count: widget.count + 1), //路由B
                          );
                        },
                      ));
                },
                child: Text("push FadeTransition")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, FadeRoute(builder: (context) {
                    return CustomRouteAnimation(count: widget.count + 1);
                  }));
                },
                child: Text("push FadeRoute"))
          ],
        ));
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      //是返回，则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
}
