import 'package:crypt/crypt.dart';

class Encryptor {
  const Encryptor._();

  static String encrypt(String key, String salt) {
    return Crypt.sha256(key, salt: salt).toString();
  }

  static bool isValid(String key, String value) {
    return Crypt(key).match(value);
  }
}
