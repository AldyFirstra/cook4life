import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService extends GetxService{
  static late SharedPreferences _preferences;

  static final _keyFirst = 'true';

  static Future init() async{
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static Future clear() async{
    _preferences.clear();
  }

  static Future setFirst(String first) async{
    await _preferences.setString(_keyFirst, first);
  }

  static String? getFirst(){
    final data = _preferences.getString(_keyFirst);

    if(data != null) return data;
    return null;
  }
}