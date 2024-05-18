import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_ready/domain/entities/auth.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/change_notifier_for_auth.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/validate_email.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';

Future<void> signInWithEmailAndPassword(
    BuildContext context, ChangeNotifierForAuth changeNotifierForAuth) async {
  try {
    if (!validateEmail(changeNotifierForAuth.emailUser)) {
      changeNotifierForAuth.errorMessage = "Неправильный формат email";
      return;
    }

    if (changeNotifierForAuth.passwordUser.length < 6) {
      changeNotifierForAuth.errorMessage =
          'Пароль должен содержать минимум 6 символов';
      return;
    }

    changeNotifierForAuth.errorMessage = '';

    await Auth().signInWithEmailAndPassword(
      email: changeNotifierForAuth.emailUser,
      password: changeNotifierForAuth.passwordUser,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      changeNotifierForAuth.errorMessage =
          'Пользователь с данным email не найден.';
    } else if (e.code == 'wrong-password') {
      changeNotifierForAuth.errorMessage =
          'Для этого пользователя был введен неправильный пароль.';
    } else {
      changeNotifierForAuth.errorMessage = 'Authentication error: ${e.message}';
    }
  } catch (e) {
    changeNotifierForAuth.errorMessage = 'An unexpected error occurred: $e';
  }
}

Future<void> createUserWithEmailAndPassword(
    BuildContext context, ChangeNotifierForAuth changeNotifierForAuth) async {
  try {
    // Validate email format before attempting to create a user
    if (!validateEmail(changeNotifierForAuth.emailUser)) {
      changeNotifierForAuth.errorMessage = "Неправильный формат email";
      return;
    }

    // Check if the password length is sufficient
    if (changeNotifierForAuth.passwordUser.length < 6) {
      changeNotifierForAuth.errorMessage =
          'Пароль должен содержать минимум 6 символов';
      return;
    }

    changeNotifierForAuth.errorMessage = '';

    // Attempt to create a new user with email and password
    await Auth().createUserWithEmailAndPassword(
      email: changeNotifierForAuth.emailUser,
      password: changeNotifierForAuth.passwordUser,
    );

    // Navigate to HomeScreen on successful user creation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    print('FirebaseAuthException: ${e.code}');
    if (e.code == 'email-already-in-use') {
      changeNotifierForAuth.errorMessage = 'Данный email уже используется.';
    } else if (e.code == 'invalid-email') {
      changeNotifierForAuth.errorMessage = 'Неправильный формат email.';
    } else {
      changeNotifierForAuth.errorMessage = 'Authentication error: ${e.message}';
    }
  } catch (e) {
    changeNotifierForAuth.errorMessage = 'An unexpected error occurred: $e';
  }
}
