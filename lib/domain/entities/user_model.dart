class UserModel {
  String? uid;
  String? email;
  String? displayName;
  String? password;

  UserModel({this.uid, this.email, this.displayName, this.password});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
        uid: data['uid'],
        email: data['email'],
        displayName: data['displayName'],
        password: data['password']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'password': password,
    };
  }
}
