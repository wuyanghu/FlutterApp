import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
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
  static final baseHost = 'bling-api.percent.cn';
  static final baseUrl = '${DYBase.baseSchema}://${DYBase.baseHost}';
  static final ossUrl = 'https://bling-file.percent.cn';
}

// http请求
final dioManager = DioCacheManager(CacheConfig(skipDiskCache: true));
final httpClient = Dio(BaseOptions(
  headers: {
    "Accept-Language": "zh-CN",
    "Content-Type": "application/json;charset=utf-8",
    "User-Agent": "BLing/1.5.0 (iPhone; iOS 14.4; Scale/2.00)",
    "deviceId": "6F3C6B1A-B05A-4E98-A3F1-2CC616D4CE9E",
    "deviceModel": "x86_64",
    "deviceName": "x86_64",
    "deviceOS": "14.4",
    "deviceType": 0,
    "osType": 1,
    "token": "",
  },
  baseUrl: DYBase.baseUrl,
  responseType: ResponseType.json,
  connectTimeout: 5000,
  receiveTimeout: 3000,
))
  ..interceptors.add(
    dioManager.interceptor,
  );

class LoginRequest {
// md5 加密
  static String generateSha1(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = sha1.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static Future<Map> loginAuthPsw(String phone, String psw) async {
    SharedPreferences perferences = await SharedPreferences.getInstance();
    if (perferences.getString("token") != null) {
      Map map = Map();
      map.addAll({
        "token": perferences.getString("token"),
        "accountId": perferences.getString("accountId"),
        "accountName": perferences.getString("accountName"),
        "tmpToken": perferences.getString("tmpToken")
      });
      print("缓存");
      return map;
    }
    var params = {
      'areaCode': '86',
      'brand': 'Apple',
      'clientVersion': "1.5.0",
      'isp': "",
      'network': 'WIFI',
      'os': "14.4",
      'password': generateSha1(psw),
      'phoneNumber': phone
    };
    httpClient.options.headers.update("token", (value) => '');
    var res;
    try {
      res = await httpClient.get(
        API.authpsw,
        queryParameters: params,
      );
    } catch (e) {
      print("登录异常");
    }

    var map = res.data['data'];

    await perferences.setString("token", map["token"]);
    await perferences.setString("accountId", map["accountId"]);
    await perferences.setString("accountName", map["accountName"]);
    await perferences.setString("tmpToken", map["tmpToken"]);
    return map;
  }
}

class Tweets {
  static Future<CircleModel> tweet(int startId, int limit) async {
    SharedPreferences perferences = await SharedPreferences.getInstance();
    String token = perferences.getString("token");
    if (token == null) {
      print("token为null");
      return null;
    }
    httpClient.options.headers.update("token", (value) => token);

    CircleModel model;
    try {
      var res = await httpClient.get(
        API.circlefriend,
        queryParameters: {
          'limit': limit,
          'startId': startId == 0 ? '' : startId
        },
      );
      var map = res.data['data'];
      model = CircleModel.fromJson(map);
    } catch (e) {
      perferences.remove("token");
      print("移除token");
    }
    return model;
  }
}
