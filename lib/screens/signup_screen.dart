import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _isObscure = true;
  bool _value = false;
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

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
                  child: Form(
                    key: _formKey,
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
                                  child: TextFormField(
                                      // obscureText: _isObscure,
                                      controller: _userNameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'UserName can\'t be empty';
                                        } else if (value.length < 4) {
                                          return 'userName can\'t be less than 6';
                                        }
                                        return null;
                                      },
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
                                  child: TextFormField(
                                      obscureText: _isObscure,
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password can\'t be empty';
                                        } else if (value.length < 6) {
                                          return 'Password can\'t be less than 6';
                                        }
                                        return null;
                                      },
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
                                    if (_formKey.currentState!.validate()) {
                                      createAccount();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[900],
                                      fixedSize: const Size(350, 50),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  child: const Text(
                                    'Sign In',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                const Text('Have an account?',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text('Log in',
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
            ),
          )),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future createAccount() async {
    try {
      final Dio dio = Dio();
      final response = await dio
          .post('https://bookstore.toolsqa.com/Account/V1/User', data: {
        'userName': _userNameController.text,
        'password': _passwordController.text
      });
      // return response;
      log(response.toString());
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Account created'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An error occured'),
        ));
      }
  
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occured'),
      ));
      log(e.toString());
    }
  }

  
}
