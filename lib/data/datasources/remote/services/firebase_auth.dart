import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // anonymous sign in
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      // Проверяем, зарегистрирован ли пользователь
      if (user != null) {
        // Пользователь успешно зарегистрирован
        return user;
      } else {
        Fluttertoast.showToast(
            msg:
                "Не удалось зарегистрироваться, при первом входе в приложение. Пожалуйста, проверьте подключение к интернету.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return null;
      }
    } catch (e) {
      DebugPrintCallback debugPrint = debugPrintThrottled;
      debugPrint(e as String?);
      return null;
    }
  }
}
