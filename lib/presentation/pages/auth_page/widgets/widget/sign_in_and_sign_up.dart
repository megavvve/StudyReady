import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_ready/domain/entities/auth.dart';
import 'package:study_ready/domain/entities/firestore_service.dart';
import 'package:study_ready/domain/entities/user_model.dart';
import 'package:study_ready/presentation/blocs/user_cubit/user_cubit.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/change_notifier_for_auth.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/widget/validate_email.dart';
import 'package:study_ready/presentation/pages/home_page/home_screen.dart';

Future<void> signInWithEmailAndPassword(
    BuildContext context, ChangeNotifierForAuth changeNotifierForAuth) async {
  try {
    if (changeNotifierForAuth.emailUser == "" ||
        changeNotifierForAuth.emailUser.isEmpty) {
      changeNotifierForAuth.errorMessage = "Введите email";
      return;
    }
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

    UserCredential? userCred = await Auth().signInWithEmailAndPassword(
      email: changeNotifierForAuth.emailUser,
      password: changeNotifierForAuth.passwordUser,
    );

    User? user = userCred?.user;
    if (user != null) {
      UserModel? oldUser = await FirestoreService().getUser(user.uid) ??
          UserModel(
            uid: "1",
            displayName: "default",
          );
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("uid", oldUser.uid ?? "");
      sharedPreferences.setString("email", oldUser.email ?? "");
      sharedPreferences.setString("displayName", oldUser.displayName ?? "");
      sharedPreferences.setString("password", oldUser.password ?? "");
      // ignore: use_build_context_synchronously
      context.read<UserCubit>().setUserModel(oldUser);
      await FirestoreService().initializeTrainersCollection(user.uid);
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
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
    if (changeNotifierForAuth.emailUser == "" ||
        changeNotifierForAuth.emailUser.isEmpty) {
      changeNotifierForAuth.errorMessage = "Введите email";
      return;
    }
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
    final userCred = await Auth().createUserWithEmailAndPassword(
      email: changeNotifierForAuth.emailUser,
      password: changeNotifierForAuth.passwordUser,
    );

    User? user = userCred?.user;
    if (user != null) {
      UserModel newUser = UserModel(
          uid: user.uid,
          email: changeNotifierForAuth.emailUser,
          displayName: changeNotifierForAuth.loginUser,
          password: changeNotifierForAuth.passwordUser);
      await FirestoreService().createUser(newUser);
      await FirestoreService().initializeTrainersCollection(user.uid);
      // ignore: use_build_context_synchronously
      context.read<UserCubit>().setUserModel(newUser);

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("uid", newUser.uid ?? "");
      sharedPreferences.setString("email", newUser.email ?? "");
      sharedPreferences.setString("displayName", newUser.displayName ?? "");
      sharedPreferences.setString("password", newUser.password ?? "");

      await Auth().signInWithEmailAndPassword(
        email: newUser.email ?? "",
        password: newUser.password ?? "",
      );
    }

    // Navigate to HomeScreen on successful user creation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
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
