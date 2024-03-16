import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_ready/domain/repositories/auth_repository.dart';
import 'package:study_ready/utils/exceptions.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      throw AuthException('Failed to sign in anonymously: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AuthException('Failed to sign out: $e');
    }
  }
}
