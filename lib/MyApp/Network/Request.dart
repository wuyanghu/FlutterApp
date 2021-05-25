import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/MyApp/CircleOfFriends/CircleModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}

// http请求
final dioManager = DioCacheManager(CacheConfig(skipDiskCache: true));
final httpClient = Dio(BaseOptions(
  baseUrl: DYBase.baseUrl,
  responseType: ResponseType.json,
  connectTimeout: 5000,
  receiveTimeout: 3000,
))
  ..interceptors.add(
    dioManager.interceptor,
  );

Future<dynamic> mock({String action}) async {
  var responseStr = await rootBundle.loadString('jsons/$action.json');
  var responseJson = json.decode(responseStr);
  return responseJson;
}

class LoginRequest {
// md5 加密
  static String generateSha1(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = sha1.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static Future<Map> loginAuthPsw(String phone, String psw) async {
    Map res = await mock(action: "user");
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
    Map res = await mock(action: "circle");
    var map = res['data'];
    CircleModel model = CircleModel.fromJson(map);
    return model;
  }
}
