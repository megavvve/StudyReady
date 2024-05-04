import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMaterialExistsToast() {
  Fluttertoast.showToast(
    msg: "Такой материал уже существует",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
  );
}
