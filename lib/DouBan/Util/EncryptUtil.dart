import 'package:encrypt/encrypt.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class EncryptUtil{
  static Future<String> encrypt(String text) async {
    String publicKeyString = "-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDNwdp2ZaXy6b05HhO9JjQPU0iBn0E+87+ZiLvqiYni7bmhe/XyWqsY8LJyFCenIfvrqZ4U2vUCROzRcZTBIWiRv2mh8I+7vXzRskgqQXNtPtYLiOrMYMFffaIxcSkj+0soLdqW2xtSQQ7X3CrGyEOfyBKVFar4GqtJdHJT1163RwIDAQAB";
    var publicKey = RSAKeyParser().parse(publicKeyString);
    ///创建加密器
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    return encrypter.encrypt(text).base64;
  }

  String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}