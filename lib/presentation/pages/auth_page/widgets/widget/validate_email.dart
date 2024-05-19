bool validateEmail(
  String email,
) {
  return _isEmailValid(email);
}

bool _isEmailValid(String email) {
  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );
  return emailRegExp.hasMatch(email);
}
