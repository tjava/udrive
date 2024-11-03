import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:udrive/core/constants/db_constant.dart';
import 'package:udrive/core/hive_objects/user_hive_object.dart';

Future<void> initHive() async {
  if (kIsWeb) {
    Hive.init(null); // Web-specific initialization
  } else {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  Hive.registerAdapter(UserHiveObjectAdapter());

  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  String? encryptionKey = await secureStorage.read(key: 'encryption_key');

  if (encryptionKey == null) {
    final keyBytes = Hive.generateSecureKey();
    encryptionKey = base64UrlEncode(keyBytes);
    await secureStorage.write(key: 'encryption_key', value: encryptionKey);
  }

  final encryptionCipher = HiveAesCipher(base64Url.decode(encryptionKey));
  await Hive.openBox<UserHiveObject>(usersBox, encryptionCipher: encryptionCipher);
}
