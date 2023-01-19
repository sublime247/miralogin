import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:miralogin/screens/login_screen.dart';
import 'package:miralogin/screens/signup_screen.dart';
// import 'package:miralogin/screens/signup_screen.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            home: const SignUp(),
          )));
}
