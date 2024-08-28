import 'package:flutter/material.dart';
import 'package:udrive/hive.dart';
import 'package:udrive/locator/locate.dart';
import 'package:udrive/main_udrive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await setupLocator();
  runApp(const MainUdrive());
}
