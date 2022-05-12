import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<void> signIn() async {
    try {
      GoogleSignInAccount? result = await _googleSignIn.signIn();
      if (result != null) {
        log("Name: " + result.displayName.toString());
        log("ID: " + result.id);
        log("Email: " + result.email);
        log("Photo: " + result.photoUrl.toString());
        await _googleSignIn.signOut();
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    }
  }
}
