import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutterapp/MyApp/CircleOfFriends/CircleModel.dart';
import 'package:flutterapp/MyApp/Help/Network/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:date_format/date_format.dart';

// 接口URL
abstract class API {
  static const authpsw = '/api/user/auth/password';
  static const circlefriend = '/api/tweet/tweets';
}

// 所有Widget继承的抽象类
abstract class DYBase {
  static final baseSchema = 'https';
  static final baseHost = 'bling-dev-api.percent.cn';
  static final baseUrl = '${DYBase.baseSchema}://${DYBase.baseHost}';
  static final ossUrl = 'https://bling-dev-api.percent.cn';
  static final thinkingUrl =
      'http://172.22.253.139:8080/Thinking/QueryAllServlet';
}

// http请求
final dioManager = DioCacheManager(CacheConfig(skipDiskCache: true));
final httpClient = Dio(BaseOptions(
  baseUrl: DYBase.baseUrl,
  responseType: ResponseType.json,
  connectTimeout: Duration(seconds: 5),
  receiveTimeout: Duration(seconds: 5),
))
  ..interceptors.add(
    dioManager.interceptor,
  );

class LoginRequest {
  static Future<Map> loginAuthPsw(String phone, String psw) async {
    Map res = await Util.mock(action: "user");
    var map = res['data'];

    SharedPreferences perferences = await SharedPreferences.getInstance();
    await perferences.setString("token", map["token"]);
    await perferences.setString("accountId", map["accountId"]);
    await perferences.setString("phoneNumber", phone);
    await perferences.setString("accountName", map["accountName"]);
    await perferences.setString("tmpToken", map["tmpToken"]);
    return map;
  }
}

class Tweets {
  static Future<CircleModel> tweet(int startId, int limit) async {
    Map res = await Util.mock(action: "circle1");
    var map = res['data'];
    CircleModel model = CircleModel.fromJson(map);
    return model;
  }
}

class ThinkingNetwork {
  static Future allThinking(Map<String,dynamic> params) async {
    String dateStr = formatDate(
        DateTime.now(), [yyyy, "-", mm, "-", dd, " ", HH, ":", nn, ":", ss]);
    String md5 = Util.generateMd5(dateStr);
    Map headers = httpClient.options.headers;
    headers.addAll({
      "Action": "query_thinking_topic",
      "RSIEncryptKey": Util.RSAEncrypted(md5)
    });

    var res = await httpClient.get(
      DYBase.thinkingUrl,
      queryParameters: params,
    );

    res.data['data'];
  }
}
