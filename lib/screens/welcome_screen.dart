import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:miralogin/screens/signup_screen.dart';
import 'package:miralogin/services/hive_service.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    putAndgetData();
    //navigata to nextPage
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const SignUp();
      }));
    });
    super.initState();
  }

  Future<void> putAndgetData() async {
    final service = HiveService();
    await service.putData('userName', key: 'fisrUser', value: 'Kushimo-Bashir');
    await service.putData('userName',
        key: 'secondUser', value: 'Sulaimon adamu');
    await service.putData('email',
        key: 'firstUser', value: 'kusimo2000@gmail.com');
    await service.putData('dob', key: 'dob', value: '12/12/2000');
    await service.putData('email', key: 'secondUser', value: 'ade@gmail.com');

    Future.delayed(const Duration(seconds: 3), () async {
      final one = await service.getData('userName', key: 'fisrUser');
      final two = await service.getData('userName', key: 'secondUser');
      final three = await service.getData('email', key: 'firstUser');
      final four = await service.getData('dob', key: 'dob');
      final five = await service.getData('email', key: 'secondUser');

      log('one: $one');
      log('two: $two');
      log('three: $three');
      log(four.toString());
      log('five: $five');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome Screen'),
      ),
    );
  }
}
