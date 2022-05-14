import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService extends GetxService {
  static late SharedPreferences instance;

  static const _keyFirst = 'true';

  static Future<SharedPreferences> init() async {
    instance = await SharedPreferences.getInstance();
    return instance;
  }

  static Future clear() async {
    instance.clear();
  }

  static Future setFirst(String first) async {
    await instance.setString(_keyFirst, first);
  }

  static String? getFirst() {
    final data = instance.getString(_keyFirst);

    if (data != null) return data;
    return null;
  }
}
