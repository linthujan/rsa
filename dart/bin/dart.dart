import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<void> main() async {
  String path = Directory.current.parent.path;

  print("Path: ${path}");

  final publicKey = await parseKeyFromFile<RSAPublicKey>(
      '$path/javascript/keys/publicKey.pem');
  final privateKey = await parseKeyFromFile<RSAPrivateKey>(
      '$path/javascript/keys/privateKey.pem');

  // final publicKey = await parseKeyFromFile<RSAPublicKey>(
  //     '$path\\javascrypt\\keys\\privateKey.pem');

  final plainText = 'Lorem ipsum dolor';
  final encrypter =
      Encrypter(RSA(publicKey: publicKey, privateKey: privateKey));

  final encrypted = encrypter.encrypt(plainText);
  final decrypted = encrypter.decrypt(encrypted);

  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted
      .base64); // kO9EbgbrSwiq0EYz0aBdljHSC/rci2854Qa+nugbhKjidlezNplsEqOxR+pr1RtICZGAtv0YGevJBaRaHS17eHuj7GXo1CM3PR6pjGxrorcwR5Q7/bVEePESsimMbhHWF+AkDIX4v0CwKx9lgaTBgC8/yJKiLmQkyDCj64J3JSE=
}
