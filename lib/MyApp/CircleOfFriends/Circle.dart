import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MyApp/CircleOfFriends/CircleModel.dart';
import 'package:flutterapp/MyApp/Mine/Load/refresh.dart';
import 'package:flutterapp/MyApp/Network/Request.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Circle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Circle();
  }
}

class _Circle extends State<Circle> {
  final int limit = 20;
  int startId = 0;

  CircleModel circleModel;
  List<Widget> list;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    list = <Widget>[];
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    super.dispose();
  }

  void loadNew() async {
    await Tweets.tweet(startId, limit);
    _refreshController.refreshCompleted();
  }

  void loadHistory() async {
    await Tweets.tweet(startId, limit);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Container(
        child: Column(
          children: [
            getAppBar(context),
            Expanded(
                child: RefreshConfiguration(
                    headerTriggerDistance: 80,
                    maxOverScrollExtent: 100,
                    footerTriggerDistance: 50,
                    maxUnderScrollExtent: 0,
                    headerBuilder: () => DYrefreshHeader(),
                    footerBuilder: () => DYrefreshFooter(),
                    child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        footer: DYrefreshFooter(
                          bgColor: Color(0xfff1f5f6),
                        ),
                        controller: _refreshController,
                        onRefresh: loadNew,
                        onLoading: loadHistory,
                        child: FutureBuilder<CircleModel>(
                            future: Tweets.tweet(startId, limit),
                            builder: (BuildContext context,
                                AsyncSnapshot<CircleModel> snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Center(
                                    child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(),
                                ));
                              }
                              if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              if (!snapshot.hasData) {
                                return const SizedBox();
                              } else {
                                return CustomScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: false,
                                  slivers: getAllCell(snapshot.data),
                                );
                              }
                            })))),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    ));
  }

  List<Widget> getAllCell(CircleModel model) {
    if (circleModel == null) {
      circleModel = model;
    } else {
      circleModel.tweetList.addAll(model.tweetList);
    }

    List<TweetList> models = model.tweetList;
    for (var model in models) {
      list.addAll(cell(model));
    }
    return list;
  }

  List<Widget> cell(TweetList model) {
    return [
      SliverToBoxAdapter(
          child: Padding(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: Row(
          children: [
            CachedNetworkImage(
                width: 40,
                height: 40,
                imageUrl: model.getUser().image.length == 0
                    ? ""
                    : DYBase.ossUrl + model.getUser().image,
                placeholder: (BuildContext context, String url) {
                  return Image.asset('assets/bling/me/me_header.png');
                }),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.getUser().nick,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xFF000000).withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text(
                      DateTime.fromMillisecondsSinceEpoch(model.createTime)
                          .toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.group,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
            Expanded(child: SizedBox()),
            FutureBuilder(
                future: model.isDel(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return SizedBox();
                  }
                  if (snapshot.data) {
                    return Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(Icons.delete, color: Colors.grey),
                    );
                  } else {
                    return SizedBox();
                  }
                })
          ],
        ),
      )),
      SliverToBoxAdapter(
          child: Padding(
        padding: EdgeInsets.only(left: 15, top: 15, right: 15),
        child: Text(
          model.content,
          style: TextStyle(
              color: Color(0xFF000000).withOpacity(0.8), fontSize: 16),
        ),
      )),
      SliverPadding(padding: const EdgeInsets.all(8.0), sliver: showPic(model)),
      SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.isLocation() ? Text(model.location) : SizedBox(),
                  model.isAtUserList()
                      ? Row(
                          children: [
                            Expanded(
                                child: Text('提及到了  ' + model.atUserString()))
                          ],
                        )
                      : SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        model.isLike()
                            ? Text(model.likeTotal.toString())
                            : SizedBox(),
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        model.isComment()
                            ? Text(model.commentTotal.toString())
                            : SizedBox()
                      ],
                    ),
                  )
                ],
              ))),
      SliverToBoxAdapter(
          child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                height: 1,
              ))),
      SliverToBoxAdapter(
        child: model.isLike()
            ? Padding(
                padding: EdgeInsets.only(top: 7.5, left: 15, right: 8),
                child: Text(
                  model.likeListString() + " 已赞",
                  style: TextStyle(color: Color(0xFF5173B1)),
                ),
              )
            : SizedBox(),
      ),
      SliverList(
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
        //创建列表项
        return Container(
          alignment: Alignment.center,
          child: Padding(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: oneComment(model.commentList[index])),
        );
      }, childCount: model.isComment() ? model.commentList.length : 0)),
      SliverToBoxAdapter(
          child: (model.isComment() && model.commentList.length > 1)
              ? Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "查看更多回复",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF5173B1)),
                  ))
              : SizedBox()),
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(left: 15),
          height: 10,
          decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
        ),
      )
    ];
  }

  Widget oneComment(CommentList list) {
    Friend friend = TweetList.getUser2(list.accountId);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                width: 40,
                height: 40,
                imageUrl: DYBase.ossUrl + friend.image,
                placeholder: (BuildContext context, String url) {
                  return Image.asset(
                    "assets/bling/me/me_header.png",
                  );
                }),
            SizedBox(
              width: 12,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(friend.nick,
                  style: TextStyle(color: Color(0xFF5173B1), fontSize: 14)),
              SizedBox(
                height: 5,
              ),
              Text(list.content,
                  style: TextStyle(
                      color: Color(0xFF000000).withOpacity(0.8), fontSize: 14)),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(list.createTime)
                        .toString(),
                    style: TextStyle(color: Color(0xFF000000).withOpacity(0.8)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 9, right: 9),
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3.0))),
                      child: Text(
                        "回复",
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 12),
                      ),
                    ),
                    onTap: () {
                      print("回复");
                    },
                  )
                ],
              ),
            ]),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.only(left: 15),
          height: 1,
          decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
        )
      ],
    );
  }

  Widget showPic(TweetList model) {
    if (model.type == TweetType.text)
      return SliverToBoxAdapter(child: SizedBox());
    if (model.type == TweetType.video || model.isOnePic()) {
      return SliverToBoxAdapter(
        child: CachedNetworkImage(
          imageUrl: DYBase.ossUrl +
              "${model.isOnePic() ? model.pictures[0].url : model.videoPreview}",
          placeholder: (BuildContext context, String url) {
            return CircularProgressIndicator();
          },
        ),
      );
    }
    return SliverGrid(
      //Grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: model.pictures.length >= 3 ? 1.0 : 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          //创建子widget
          return Container(
              alignment: Alignment.topLeft,
              child: CachedNetworkImage(
                imageUrl: DYBase.ossUrl +
                    "${model.pictures.length > 0 ? model.pictures[index].url : model.videoPreview}",
                placeholder: (BuildContext context, String url) {
                  return SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  );
                },
              ));
        },
        childCount: model.pictures.length,
      ),
    );
  }

  Widget getAppBar(BuildContext context) {
    return Container(
        color: Color(0xFF5173B1),
        child: Padding(
          padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: MediaQuery.of(context).padding.top,
              bottom: 15),
          child: Row(
            children: [
              InkWell(
                child: SizedBox(
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 30,
                  ),
                  width: 40,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                  child: Text(
                "朋友圈",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
                textAlign: TextAlign.center,
              )),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ));
  }
}
