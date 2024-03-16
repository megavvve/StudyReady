import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInAnonymously();
  Future<void> signOut();
}
