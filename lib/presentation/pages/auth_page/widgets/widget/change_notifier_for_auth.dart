import 'package:flutter/material.dart';

class ChangeNotifierForAuth extends ChangeNotifier {
  String _emailUser = '';
  String _loginUser = '';
  String _passwordUser = '';
  bool _isNeedRegister = false;
  String _errorMessage = '';

  String get emailUser => _emailUser;
  String get errorMessage => _errorMessage;
  String get loginUser => _loginUser;
  String get passwordUser => _passwordUser;
  bool get isNeedRegistry => _isNeedRegister;

  set emailUser(String value) {
    _emailUser = value;
    notifyListeners();
  }

  set loginUser(String value) {
    _loginUser = value;
    notifyListeners();
  }

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  set passwordUser(String value) {
    _passwordUser = value;
    notifyListeners();
  }

  set isNeedRegistry(bool value) {
    _isNeedRegister = value;
    notifyListeners();
  }
}
