import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // anonymous sign in
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
    } catch(e) {
      DebugPrintCallback debugPrint = debugPrintThrottled;
      debugPrint(e as String?);
      return null;
    }
  }

}