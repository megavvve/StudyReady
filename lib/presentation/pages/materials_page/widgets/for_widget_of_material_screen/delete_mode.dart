import 'package:flutter/material.dart';

class DeleteMode extends ChangeNotifier {
  bool _isDeleting = false;

  bool get isDeleting => _isDeleting;

  void toggleDeleteMode() {
    _isDeleting = !_isDeleting;
    notifyListeners();
  }

  set isDeleting(bool value) {
    _isDeleting = value;
    notifyListeners();
  }
}
