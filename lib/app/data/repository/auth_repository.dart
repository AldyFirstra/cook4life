import 'dart:convert';

import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/api/services/auth_services.dart';
import 'package:tugas_akhir/app/data/utils/service_preferences.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

import '../models/user.dart';

class AuthRepository {
  AuthRepository._();
  static final AuthRepository _instance = AuthRepository._();
  static AuthRepository get instance => _instance;
  final _authServices = AuthServices.instance;

  Future<User?> signIn(
      {required String email,
      required String foto,
      required String password,
      required String name}) async {
    var response = await _authServices.signIn(
        email: email, foto: foto, password: password, name: name);
    if (response != null) {
      PreferenceService.instance
          .setString('user', json.encode(response.toMap()));
      Get.find<AppController>().user = response;
      return response;
    } else {
      return null;
    }
  }
}
