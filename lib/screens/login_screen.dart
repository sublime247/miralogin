import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:miralogin/provider/login_provider.dart';
import 'package:miralogin/provider/login_state.dart';
import 'package:miralogin/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isObscure = true;
  bool _value = false;
   final TextEditingController _userNameController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late  LoginProvider _loginProvider;
  @override
  void initState() {
        _loginProvider = LoginProvider()
      ..addListener(() {
        final state = _loginProvider.currentState;
        if (state is LoginStateLoaded) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const HomeScreen();
          }));
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
      value: _loginProvider,
      child: KeyboardDismissOnTap(
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
                                child: Text('UserName',
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
                                      // hintText: 'example@gmail.com',
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
                            Selector<LoginProvider, LoginState>(
                                selector: (
                                  BuildContext context,
                                  LoginProvider provider,
                                ) =>
                                    _loginProvider.currentState,
                                builder:
                                    (context, LoginState state, Widget? child) {
                                  return ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _loginProvider.login(
                                            _userNameController.text,
                                            _passwordController.text,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue[900],
                                          fixedSize: const Size(350, 50),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      child: state is LoginStateLoading
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.white),
                                            )
                                          : const Text(
                                              'Login',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ));
                                }),
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
                      ]),
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
