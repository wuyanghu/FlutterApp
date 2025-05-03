import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

class Util {
  static String generateSha1(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = sha1.convert(content);
    return hex.encode(digest.bytes);
  }

  // static String generateAes128(String data) {
  //   var content = new Utf8Encoder().convert(data);
  //   var digest = aes.convert(content);
  //   return hex.encode(digest.bytes);
  // }

  static Future<String> RSAEncrypted(String data) async {
    final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public.pem');
    final encrypter = Encrypter(RSA(publicKey: publicKey));

    final encrypted = encrypter.encrypt(data);
    return encrypted.toString();
  }

  // md5 加密
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static Future<dynamic> mock({required String action}) async {
    var responseStr = await rootBundle.loadString('jsons/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson;
  }
}
