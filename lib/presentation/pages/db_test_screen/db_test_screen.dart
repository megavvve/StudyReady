import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataBaseScreen extends StatefulWidget {
  const DataBaseScreen({
    super.key,
  });

  @override
  State<DataBaseScreen> createState() => _DataBaseScreen();
}

class _DataBaseScreen extends State<DataBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataBase test'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
                ),
                onPressed: () { },
                child: const Text('TextButton'),
              )
          ],
        ),
      ),
    );
  }
}
