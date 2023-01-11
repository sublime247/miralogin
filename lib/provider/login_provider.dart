import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:miralogin/provider/login_state.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    _currentState = LoginStateInitial();
  }
  late LoginState _currentState;
  LoginState get currentState => _currentState;

  Future<void> login(String username, String password) async {
     try {
      _emit(LoginStateLoading());
      final dio = Dio();
      final response = await dio
          .post('https://bookstore.demoqa.com/Account/v1/GenerateToken', data: {
        "userName": username,
        "password": password
      });
      if(response.statusCode == 200){
        _emit(LoginStateLoaded());
      }else{
        _emit(LoginStateError('Something went wrong'));
      }
      print(response.toString());
    } catch (e) {
      print(e);
    }
  }

  _emit(LoginState state) {
    _currentState = state;
    notifyListeners();
  }

  @override
  void dispose() {
    _currentState = LoginStateInitial();
    super.dispose();
  }
}
