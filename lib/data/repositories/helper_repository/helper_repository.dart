import 'package:shared_preferences/shared_preferences.dart';

import 'helper_repository_interface.dart';

class HelperRepository implements HelperRepositoryInterface {

  HelperRepository({required this.preferences});

  final SharedPreferences preferences;

  static const isSwitchedOff = "swithced_off";

  @override
  bool isOff() {
    final helper = preferences.getBool(isSwitchedOff);
    return helper ?? false;
  }

  @override
  Future<void> switchHelper(bool value) async {
    await preferences.setBool(isSwitchedOff, value);
  }
  
}