import 'package:shared_preferences/shared_preferences.dart';

class CircleModel {
  int startId;
  List<TweetList> tweetList;
  bool isBottom;

  CircleModel({this.startId, this.tweetList, this.isBottom});

  CircleModel.fromJson(Map<String, dynamic> json) {
    startId = json['startId'];
    if (json['tweetList'] != null) {
      tweetList = new List<TweetList>();

      for (int i = 0; i < json['tweetList'].length; i++) {
        TweetList list;
        try {
          list = new TweetList.fromJson(json['tweetList'][i]);
        } catch (e) {
          print("json解析出现问题");
        }
        if (list != null) {
          tweetList.add(list);
        }
      }
    }
    isBottom = json['isBottom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startId'] = this.startId;
    if (this.tweetList != null) {
      data['tweetList'] = this.tweetList.map((v) => v.toJson()).toList();
    }
    data['isBottom'] = this.isBottom;
    return data;
  }
}

class Friend {
  String accountId;
  String nick;
  String image;
  Friend({this.accountId, this.nick, this.image});
}

Map<String, Friend> friendMap = {
  "uid_062a07477d6f392e417d53b6": Friend(
      nick: "6009",
      image:
          "/image/picture/d482df1d-e9bd-44fe-946d-56150a884dbd_compressed.jpg"),
  "uid_278932dca2690066": Friend(
      nick: "6008",
      image: "/image/picture/f7c987d3-f517-465d-be31-65b3960be75d_scaled.png"),
  "uid_403d1090f451e923": Friend(
      nick: "6001",
      image:
          "/image/picture/c77d83cf-e92c-42d9-bf08-9ad5e97e4d6d_compressed.jpg"),
  "uid_81298f569fab3e4d": Friend(
      nick: "某非著名程序员",
      image: "/image/picture/8dafc122-1168-496e-99cb-138df5748a47_scaled.png"),
  "uid_8d14c4163c4ba277": Friend(
      nick: "iOS-袁晓栋",
      image: "/image/picture/3a1d416d-e476-44e4-82f5-838f82761278_scaled.png"),
  "uid_b5793fddff8d9ee3": Friend(
      nick: "Yuan2",
      image: "/image/picture/bfb378f5-4dfb-4cfc-b7bf-25b57994ea71_scaled.png"),
  "uid_c01a7bde40c4be3010833881": Friend(
      nick: "黄龙浩",
      image: "/image/picture/81a14d9b-1e3f-4f0e-b88c-eb4428416af1_scaled.png"),
  "uid_c34d94e2d1a9c2fc": Friend(
      nick: "张守成",
      image: "/image/picture/dbd88b30-a69f-4f61-a023-0520833bbd71_scaled.png"),
  "uid_d43ac5f189680cc3": Friend(nick: "Yuan3", image: ""),
  "uid_7513f972395d5bce": Friend(nick: "会飞的鱼", image: "")
};

enum TweetType {
  text, //文字朋友圈
  pic, //图片朋友圈
  video //视频朋友圈
}

class TweetList {
  String tweetId;
  TweetType type;
  String accountId;
  int createTime;
  String content;
  List<String> atUserList;
  List<Pictures> pictures;
  int width;
  int height;
  Config config;
  List<String> likeList;
  int commentTotal;
  int likeTotal;
  List<CommentList> commentList;
  String video;
  String videoPreview;
  String location = ''; //具体返回字段需要确定

  TweetList({
    this.tweetId,
    this.type,
    this.accountId,
    this.createTime,
    this.content,
    this.atUserList,
    this.pictures,
    this.width,
    this.height,
    this.config,
    this.likeList,
    this.commentTotal,
    this.likeTotal,
    this.commentList,
    this.video,
    this.videoPreview,
    this.location,
  });

  TweetList.fromJson(Map<String, dynamic> json) {
    tweetId = json['tweetId'];
    if (json['type'] == 0) {
      type = TweetType.text;
    } else if (json['type'] == 1) {
      type = TweetType.pic;
    } else {
      type = TweetType.video;
    }

    accountId = json['accountId'];
    createTime = json['createTime'];
    content = json['content'];
    atUserList =
        json['atUserList'] != null ? json['atUserList'].cast<String>() : null;
    if (json['pictures'] != null) {
      pictures = new List<Pictures>();
      json['pictures'].forEach((v) {
        pictures.add(new Pictures.fromJson(v));
      });
    }
    width = json['width'];
    height = json['height'];
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    likeList =
        json['likeList'] != null ? json['likeList'].cast<String>() : null;
    commentTotal = json['commentTotal'];
    likeTotal = json['likeTotal'];
    if (json['commentList'] != null) {
      commentList = new List<CommentList>();
      json['commentList'].forEach((v) {
        commentList.add(new CommentList.fromJson(v));
      });
    }
    video = json['video'];
    videoPreview = json['videoPreview'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tweetId'] = this.tweetId;
    data['type'] = this.type;
    data['accountId'] = this.accountId;
    data['createTime'] = this.createTime;
    data['content'] = this.content;
    data['atUserList'] = this.atUserList;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    data['width'] = this.width;
    data['height'] = this.height;
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    data['likeList'] = this.likeList;
    data['commentTotal'] = this.commentTotal;
    data['likeTotal'] = this.likeTotal;
    if (this.commentList != null) {
      data['commentList'] = this.commentList.map((v) => v.toJson()).toList();
    }
    data['video'] = this.video;
    data['videoPreview'] = this.videoPreview;
    data['location'] = location;
    return data;
  }

  Friend getUser() {
    return getUser2(accountId);
  }

  static Friend getUser2(String accountId) {
    Friend model = friendMap[accountId];
    if (model == null) {
      print("没找到 user" + accountId);
      model = Friend(nick: "张三", image: '');
    }
    return model;
  }

  Future<bool> isDel() async {
    SharedPreferences perferences = await SharedPreferences.getInstance();
    String meAccountId = perferences.getString("accountId");
    return meAccountId == accountId;
  }

  bool isComment() {
    return commentTotal != null && commentTotal > 0;
  }

  bool isLike() {
    return likeTotal != null && likeTotal > 0;
  }

  bool isAtUserList() {
    return atUserList != null && atUserList.length > 0;
  }

  bool isOnePic() {
    return pictures != null && pictures.length == 1;
  }

  bool isLocation() {
    return location != null;
  }

  String atUserString() {
    String atString = "";
    for (int i = 0; i < atUserList.length; i++) {
      atString += getUser2(atUserList[i]).nick;
      if (i != atUserList.length - 1) {
        atString += "、";
      }
    }
    return atString;
  }

  String likeListString() {
    String likeString = "";
    for (int i = 0; i < likeList.length; i++) {
      likeString += getUser2(likeList[i]).nick;
      if (i != likeList.length - 1) {
        likeString += "、";
      }
    }
    return likeString;
  }
}

class Pictures {
  int width;
  String url;
  int height;

  Pictures({this.width, this.url, this.height});

  Pictures.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    url = json['url'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['url'] = this.url;
    data['height'] = this.height;
    return data;
  }
}

class Config {
  List<String> userList;
  bool isVisible;
  bool isPrivate;

  Config({this.userList, this.isVisible, this.isPrivate});

  Config.fromJson(Map<String, dynamic> json) {
    userList =
        json['userList'] != null ? json['userList'].cast<String>() : null;
    isVisible = json['isVisible'];
    isPrivate = json['isPrivate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userList'] = this.userList;
    data['isVisible'] = this.isVisible;
    data['isPrivate'] = this.isPrivate;
    return data;
  }
}

class CommentList {
  String id;
  String accountId;
  String content;
  int createTime;
  String for1;

  CommentList(
      {this.id, this.accountId, this.content, this.createTime, this.for1});

  CommentList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    content = json['content'];
    createTime = json['createTime'];
    for1 = json['for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['for'] = this.for1;
    return data;
  }
}
