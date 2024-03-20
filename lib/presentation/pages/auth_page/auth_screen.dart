// here we go to put the layout code.

import 'package:flutter/material.dart';
import 'package:study_ready/presentation/navigation/navigation_bar.dart';
import 'package:study_ready/presentation/pages/auth_page/widgets/login_form.dart';
import 'package:study_ready/presentation/navigation/burger_navigation_leading.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return BurgerNavigationLeading(context);
        }),
      ),
      drawer: const NavigatorDrawer(),
      body: const MyCustomForm(),
    );
  }
}

//void main() => runApp(const AuthScreen());
