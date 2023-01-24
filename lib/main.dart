import 'package:flutter/material.dart';
import 'package:miralogin/screens/welcome_screen.dart';
import 'package:miralogin/services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const MaterialApp(
    home: Welcome(),
  ));
}
