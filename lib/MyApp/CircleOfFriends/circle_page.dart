import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyApp/CircleOfFriends/circle_model.dart';
import 'package:flutter_app/MyApp/Help/Network/Request.dart';
import 'package:flutter_app/MyApp/Media/PrePhoto.dart';
import 'package:flutter_app/MyApp/Media/BumbleBeeRemoteVideo.dart';
import 'package:flutter_app/MyApp/Mine/Load/refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CirclePage extends StatefulWidget {
  static String route = 'CirclePage';
  CirclePage();

  @override
  State<StatefulWidget> createState() {
    return _CirclePageState();
  }
}

class _CirclePageState extends State<CirclePage> {
  final int limit = 20;
  int startId = 0;

  late CircleModel circleModel;
  late List<Widget> cells;
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
    cells = <Widget>[];
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    super.dispose();
  }

  void loadNew() async {
    print("加载新数据");
    _refreshController.resetNoData();

    startId = 0;
    circleModel = await Tweets.tweet(startId, limit);
    if (cells.length > 0) {
      cells.removeRange(0, cells.length);
    }
    for (var model in circleModel.tweetList ?? []) {
      cells.addAll(cell(model));
    }
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  void loadHistory() async {
    print("加载历史数据");
    startId = circleModel.startId ?? 0;
    CircleModel historyCircleModel = await Tweets.tweet(startId, limit);

    for (var model in historyCircleModel.tweetList ?? []) {
      cells.addAll(cell(model));
    }
    circleModel.startId = historyCircleModel.startId;

    setState(() {
      if (historyCircleModel.isBottom == true) {
        _refreshController.loadNoData();
      } else {
        _refreshController.loadComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: false,
            child: Container(
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
                                child: CustomScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: false,
                                  slivers: cells,
                                )))),
                  ],
                ),
              ),
            )));

  }

  List<Widget> cell(TweetList model) {
    return [
      header(model),
      content(model),
      SliverPadding(padding: const EdgeInsets.all(8.0), sliver: showPic(model)),
      likeFavor(model),
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
                padding:
                    EdgeInsets.only(top: 7.5, left: 15, right: 8, bottom: 10),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: model.likeListString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5173B1)),
                    ),
                    TextSpan(
                        text: " 已赞",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000).withOpacity(0.8)))
                  ]),
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
              child: oneComment(model.commentList![index])),
        );
      }, childCount: model.commentNum())),
      SliverToBoxAdapter(
          child: (model.isMoreComment())
              ? InkWell(
                  child: Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "查看更多回复",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF5173B1)),
                      )),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "查看更多回复,暂未开发", gravity: ToastGravity.CENTER);
                  },
                )
              : SizedBox()),
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.zero,
          height: 10,
          decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
        ),
      )
    ];
  }

  Widget header(TweetList model) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.only(left: 15, top: 20, right: 15),
      child: Row(
        children: [
          model.getUser().image.length == 0
              ? Image.asset(
                  'assets/bling/me/me_header.png',
                  width: 40,
                  height: 40,
                )
              : CachedNetworkImage(
                  width: 40,
                  height: 40,
                  imageUrl: DYBase.ossUrl + model.getUser().image,
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
                    DateTime.fromMillisecondsSinceEpoch(model.createTime!)
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
                if (snapshot.data != null) {
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
    ));
  }

  Widget content(TweetList model) {
    return SliverToBoxAdapter(
        child: model.content != null
            ? Padding(
                padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Text(
                  model.content!,
                  style: TextStyle(
                      color: Color(0xFF000000).withOpacity(0.8), fontSize: 16),
                ),
              )
            : SizedBox());
  }

  Widget showPic(TweetList model) {
    if (model.type == TweetType.text) {
      return SliverToBoxAdapter(child: SizedBox());
    } else if (model.type == TweetType.video || model.isOnePic()) {
      int width;
      int height;
      if (model.isOnePic()) {
        width = model.pictures![0].width!;
        height = model.pictures![0].height!;
      } else {
        width = model.width!;
        height = model.height!;
      }
      Size size = getImageSize(Size(width.toDouble(), height.toDouble()));
      String url = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
      return SliverToBoxAdapter(
        child: InkWell(
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      width: size.width,
                      height: size.height,
                      alignment: Alignment(-1, 0),
                      imageUrl: url,
                      placeholder: (BuildContext context, String url) {
                        return customCircularProgressIndicator();
                      },
                    ),
                    model.isOnePic()
                        ? SizedBox()
                        : SizedBox(
                            width: size.width,
                            height: size.height,
                            child: Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 50,
                              ),
                            ),
                          )
                  ],
                )),
            onTap: () {
              if (model.isOnePic()) {
                _showPhotoGallery([url], tag: model.accountId!);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BumbleBeeRemoteVideo(
                    videoUrl: url,
                  );
                }));
              }
            }),
      );
    }
    return SliverGrid(
      //Grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          //创建子widget
          String url = DYBase.ossUrl + model.pictures![index].url!;
          return InkWell(
            child: cornerImage(url, 5.0),
            onTap: () {
              print("点击图片");
              _showPhotoGallery(model.pictureSfullUrl(), tag: model.accountId!);
            },
          );
        },
        childCount: model.pictures!.length,
      ),
    );
  }

  Widget likeFavor(TweetList model) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                model.isLocation() ? Text(model.location!) : SizedBox(),
                model.isAtUserList()
                    ? Row(
                        children: [
                          Expanded(
                              child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: '提及到了  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF5173B1)),
                              ),
                              TextSpan(
                                  text: model.atUserString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color(0xFF000000).withOpacity(0.8)))
                            ]),
                          ))
                        ],
                      )
                    : SizedBox(),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        child: FutureBuilder<bool>(
                            future: model.isLiked(),
                            builder: (BuildContext context,
                                AsyncSnapshot<bool> snapshot) {
                              if (snapshot.hasData) {
                                return InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "收藏功能,暂未开发",
                                          gravity: ToastGravity.CENTER);
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: snapshot.data != null
                                          ? Colors.red
                                          : Colors.grey,
                                    ));
                              }
                              return SizedBox();
                            }),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      model.isLike()
                          ? Text(
                              model.likeTotal.toString(),
                              textAlign: TextAlign.center,
                            )
                          : SizedBox(),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "评论功能,暂未开发", gravity: ToastGravity.CENTER);
                        },
                        child: Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      model.isComment()
                          ? Text(model.commentTotal.toString(),
                              textAlign: TextAlign.center)
                          : SizedBox()
                    ],
                  ),
                )
              ],
            )));
  }

  Widget oneComment(CommentList list) {
    Friend friend = TweetList.getUser2(list.accountId!);
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
              Text(list.content!,
                  style: TextStyle(
                      color: Color(0xFF000000).withOpacity(0.8), fontSize: 14)),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(list.createTime!)
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

  Widget getAppBar(BuildContext context) {
    return Container(
        color: Color(0xFF5173B1),
        child: Padding(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: MediaQuery.of(context).padding.top,
                bottom: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
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
                    InkWell(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "发送朋友圈,功能暂未开发", gravity: ToastGravity.CENTER);
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ],
            )));
  }

  Widget cornerImage(String url, double radius) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (BuildContext context, String url) {
            return customCircularProgressIndicator();
          },
        ));
  }

  Widget customCircularProgressIndicator() {
    return Center(
        child: SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(),
    ));
  }

  Size getImageSize(Size size) {
    if (size.width == 0 && size.height == 0) {
      return Size(0, 0);
    }
    double minSize = 90.0;
    double maxSize = 250.0;
    Size thumbnailSize = size;
    double scale = maxSize / size.height;
    double _width = size.width * scale;

    if (_width < minSize) {
      scale = minSize / size.width;
      thumbnailSize = Size(minSize, size.height * scale);
    } else if (_width > maxSize) {
      scale = minSize / size.height;
      if (scale * size.width <= maxSize) {
        thumbnailSize = Size(maxSize, size.height * (maxSize / size.width));
      } else {
        thumbnailSize = Size(minSize, scale * size.width);
      }
    } else {
      thumbnailSize = Size(_width, maxSize);
    }

    return thumbnailSize;
  }

  // 图片预览gallery
  void _showPhotoGallery(List pic, {int index = 0, String tag = ''}) {
    var galleryItems = pic
        .asMap()
        .map((i, item) {
          return MapEntry(
              i,
              GalleryItem(
                id: tag,
                resource: item,
              ));
        })
        .values
        .toList();
    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation secondaryAnimation) {
      return FadeTransition(
        opacity: animation,
        child: GalleryPhotoViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal, loadingChild: null,
        ),
      );
    }));
  }
}
