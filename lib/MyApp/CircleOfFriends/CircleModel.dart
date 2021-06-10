import 'package:flutterapp/MyApp/Help/Network/Request.dart';
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
      nick: "iOS-YuanDev1",
      image: "/image/picture/3a1d416d-e476-44e4-82f5-838f82761278_scaled.png"),
  "uid_b5793fddff8d9ee3": Friend(
      nick: "Yuan2",
      image: "/image/picture/bfb378f5-4dfb-4cfc-b7bf-25b57994ea71_scaled.png"),
  "uid_c01a7bde40c4be3010833881": Friend(
      nick: "huanglonghao",
      image: "/image/picture/81a14d9b-1e3f-4f0e-b88c-eb4428416af1_scaled.png"),
  "uid_c34d94e2d1a9c2fc": Friend(
      nick: "zhangshoucheng",
      image: "/image/picture/dbd88b30-a69f-4f61-a023-0520833bbd71_scaled.png"),
  "uid_d43ac5f189680cc3": Friend(nick: "Yuan3", image: ""),
  "uid_7513f972395d5bce": Friend(nick: "会飞的鱼", image: ""),
  //dev
  "uid_095ef1ba797de3ec": Friend(
      nick: "测试6009",
      image:
          "/image/picture/4d7d15d5-e7e6-485e-8f54-77ac1f702f2b_compressed.jpg"),
  "uid_1136c47b7933e753": Friend(nick: "002", image: ""),
  "uid_16132be4870619c7": Friend(
      nick: "123",
      image:
          "/image/picture/90ad6f5f-4199-4de9-ab88-5b12051dbea8_compressed.jpg"),
  "uid_1792db9d7f29c42770e006bf": Friend(
      nick: "Eliza Garcia",
      image: "/image/picture/1ad1c004-3c93-478c-8cfb-a294ca11abad_compressed."),
  "uid_3f27632285783f5eaa48e38b": Friend(
      nick: "mujianguo",
      image: "/image/picture/4b87f2f0-409a-41ea-b04c-ae7302fcc0d9_compressed."),
  "uid_40422366d22137af": Friend(
      nick: "YuanDev1",
      image: "/image/picture/6f404280-7fc9-492c-95bb-0b30da455da9_scaled.png"),

  "uid_4b7f4d92772c34ae": Friend(
      nick: "ggg157",
      image:
          "/image/picture/52b37da7-cfdc-4b09-92f1-caf0027ed666_compressed.jpg"),
  "uid_b89cfc2d00a73f59": Friend(
      nick: "135ggg",
      image:
          "/image/picture/f0075701-92a9-48b4-8c8c-916935dcb8dd_compressed.jpg"),
  "uid_a19b667ac859fe2d": Friend(
      nick: "测试6008",
      image:
          "/image/picture/27941873-49aa-44c9-815f-31733e51004b_compressed.jpg"),
  "uid_400443b27881d299": Friend(
      nick: "教师2",
      image: "/image/picture/e6b5a2a1-c5c1-4734-8cb9-858c96111d08_scaled.png"),
  "uid_84c4255d027a5582d29d7456": Friend(
      nick: "测试6001",
      image:
          "/image/picture/ad58d79e-f574-43da-b9df-c47b29230d10_compressed.jpg"),
  "uid_6c6f70100f8a8da4": Friend(nick: "0001", image: ""),
  "uid_6afe6f313c3b105d": Friend(
      nick: "zhangshoucheng",
      image: "/image/picture/b28277c7-e65a-450b-88b5-33ace5029a09_compressed."),
  "uid_cdf47f6df1ffa53b": Friend(
      nick: "Yuandev2",
      image: "/image/picture/aa3c9e72-9c80-48ca-8bdb-d8071c1aafdc_scaled.png"),
  "uid_efc16f6a4798b0d8": Friend(
      nick: "Borg Penn",
      image:
          "/image/picture/a503fca3-905f-44a8-bf1e-81d9392eec88_compressed.jpg"),
  "uid_58a6af9628ac61c72e65bb41": Friend(
      nick: "Kathy Jones ",
      image: "/image/picture/e90c4810-0817-4fd9-a45c-d21d307d9411_scaled.png"),
  "uid_ee17f4fd9cb76db2": Friend(
      nick: "fxfdev",
      image:
          "/image/picture/e062e7bd-8b54-43ab-ad91-65bd7143e3c0_compressed.jpg"),
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
  String location; //具体返回字段需要确定

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
      print("没找到 user = " + accountId);
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

  bool isMoreComment() {
    return isComment() && commentList.length > 3;
  }

  int commentNum() {
    if (!isComment()) {
      return 0;
    } else {
      if (commentList.length <= 3) {
        return commentList.length;
      } else {
        return 3;
      }
    }
  }

  bool isLike() {
    return likeTotal != null && likeTotal > 0;
  }

  Future<bool> isLiked() async {
    SharedPreferences perferences = await SharedPreferences.getInstance();
    String meAccountId = perferences.getString("accountId");
    if (likeList == null) {
      return false;
    }
    bool res = likeList.contains(meAccountId);
    return res;
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

  List<String> pictureSfullUrl() {
    List<String> urls = [];
    for (int i = 0; i < pictures.length; i++) {
      urls.add(DYBase.ossUrl + pictures[i].url);
    }
    return urls;
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
