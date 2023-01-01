import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main() {
  runApp(const MaterialApp(home: Login()));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isObscure = true;
  bool _value = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Mirra',
                              style: TextStyle(
                                  fontFamily: 'Gabriela',
                                  fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue[900]),
                            )),
                        const SizedBox(height: 30),
                        Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: const Text(
                              'Welcome Back!',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          child: const Text(
                            'Login into your account. Share glad tidings \n with your loved ones',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5.0),
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text('Email',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[700])),
                              ),
                              Center(
                                  child: SizedBox(
                                width: 350,
                                //  margin: EdgeInsets.only(left: 5),
                                child: TextField(
                                    obscureText: _isObscure,
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      hintText: 'example@gmail.com',
                                    )),
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 5.0),
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text('Password',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700]))),
                              Center(
                                  child: SizedBox(
                                width: 350,
                                child: TextField(
                                    obscureText: _isObscure,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                          icon: Icon(_isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off)),
                                      hintText: '***********',
                                    )),
                              ))
                            ]),
                        const SizedBox(height: 25),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Forgotten password?',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue[900])),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: _value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _value = value!;
                                    });
                                  }),
                              Text('Remember me',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue[900]))
                            ]),
                        const SizedBox(height: 25),
                        Center(
                          child: Column(children: [
                            ElevatedButton(
                                onPressed: () {
                                  createAccount();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[900],
                                    fixedSize: const Size(350, 50),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(350, 50),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Image(
                                          image: AssetImage(
                                              'assets/flat-color-icons_google.png')),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Continue with Google',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ]))
                          ]),
                        ),
                        const SizedBox(height: 15),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue[900])),
                              )
                            ]),
                      ]),
                ),
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future createAccount() async {
    try {
      final Dio dio = Dio();
      log(_emailController.text);
      log(_passwordController.text);
      final response = await dio
          .post('https://bookstore.toolsqa.com/Account/V1/User', data: {
        'userName': _emailController.text,
        'password': _passwordController.text
      });
      log(response.toString());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
        content: Text('An error occured'),
      ));
      log(e.toString());
    }
  }
}
