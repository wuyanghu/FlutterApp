import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';

class Util {
  // md5 加密
  static String generateSha1(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = sha1.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static Future<dynamic> mock({String action}) async {
    var responseStr = await rootBundle.loadString('jsons/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson;
  }
}
