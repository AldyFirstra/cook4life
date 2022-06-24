import 'dart:convert';

import 'package:tugas_akhir/app/data/api/network.dart';

import '../../models/user.dart';

class AuthServices {
  AuthServices._();
  static final AuthServices _instance = AuthServices._();
  static AuthServices get instance => _instance;

  final _auth = '/api/google_sign_in';
  final _fcm = '/api/fcm';

  Future<User?> signIn(
      {required String email,
      required String foto,
      required String password,
      required String name}) async {
    var response = await API.post(_auth, body: {
      'email': email,
      'foto': foto,
      'password': password,
      'name': name
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> body = json.decode(response.body);
      return User.fromMap(body['data'])..token = body['token'];
    } else {
      return null;
    }
  }

  Future<void> saveFCM({required String fcm}) async {
    await API.post(_fcm, body: {'fcm': fcm});
  }
}
