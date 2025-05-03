// 下拉刷新头部、底部组件
import 'package:flutter/material.dart';
import 'package:flutter_app/MyApp/Help/Network/Request.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DYrefreshHeader extends StatelessWidget with DYBase {
  @override
  Widget build(BuildContext context) {
    final refreshing = Lottie.asset("assets/if_refresh.json", height: 50);

    return CustomHeader(
        refreshStyle: RefreshStyle.Follow,
        builder: (BuildContext context, RefreshStatus? status) {
          bool swimming = (status == RefreshStatus.refreshing ||
              status == RefreshStatus.completed);
          return Container(
              height: 50,
              child: Stack(alignment: AlignmentDirectional.center, children: [
                swimming
                    ? SizedBox()
                    : Image.asset(
                        'assets/images/fun_home_pull_down.png',
                        height: 50,
                      ),
                Offstage(
                  offstage: !swimming,
                  child: refreshing,
                ),
              ]));
        });
  }
}

class DYrefreshFooter extends StatelessWidget with DYBase {
  final bgColor;
  DYrefreshFooter({this.bgColor});

  @override
  Widget build(BuildContext context) {
    final height = 50.0;

    return CustomFooter(
      height: height,
      builder: (BuildContext context, LoadStatus? mode) {
        final textStyle = TextStyle(
          color: Color(0xffA7A7A7),
          fontSize: 13,
        );
        Widget body;
        Widget loading = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/loading.json", height: 34),
            Text(
              '用力加载中...',
              style: textStyle,
            ),
          ],
        );
        if (mode == LoadStatus.idle) {
          body = loading;
        } else if (mode == LoadStatus.loading) {
          body = loading;
        } else if (mode == LoadStatus.failed) {
          body = Text(
            '网络出错啦 😭',
            style: textStyle,
          );
        } else if (mode == LoadStatus.canLoading) {
          body = loading;
        } else {
          body = Text(
            '我是有底线的 😭',
            style: textStyle,
          );
        }
        print(mode);
        return Container(
          color: bgColor,
          height: height,
          child: Center(child: body),
        );
      },
    );
  }
}
