import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<void> main() async {
  String path = Directory.current.parent.path;

  print("Path: $path");

  final publicKey = await parseKeyFromFile<RSAPublicKey>(
      '$path/javascript/keys/publicKey.pem');
  final privateKey = await parseKeyFromFile<RSAPrivateKey>(
      '$path/javascript/keys/privateKey.pem');

  final plainText = 'Linthujan';
  final encrypter = Encrypter(RSA(
      publicKey: publicKey,
      privateKey: privateKey,
      encoding: RSAEncoding.OAEP));

  final encrypted = encrypter.encrypt(plainText);
  await File('$path/javascript/data/dart_encrypted.txt')
      .writeAsString(encrypted.base64);

  String encryptedText =
      await File('$path/javascript/data/node_encrypted.txt').readAsString();
  final decrypted = encrypter.decrypt64(encryptedText);

  print(decrypted);

  final plainText2 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final key = Key.fromSecureRandom(32);
  final iv = IV.fromLength(16);

  final encrypterAES = Encrypter(AES(key));
  print(key.base64);
  final encrypted2 = encrypterAES.encrypt(plainText2, iv: iv);
  final decrypted2 = encrypterAES.decrypt(encrypted2, iv: iv);

  print(decrypted2);
  print(encrypted2.base64);
}
