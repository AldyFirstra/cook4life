import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tugas_akhir/app/data/repository/auth_repository.dart';
import 'package:tugas_akhir/app/extra/widget.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<void> signIn() async {
    Custom.loading();
    try {
      GoogleSignInAccount? result = await _googleSignIn.signIn();
      if (result != null) {
        var user = await AuthRepository.instance.signIn(
            email: result.email,
            foto: result.photoUrl.toString(),
            password: result.id,
            name: result.displayName.toString());
        log("Name: " + result.displayName.toString());
        log("ID: " + result.id);
        log("Email: " + result.email);
        log("Photo: " + result.photoUrl.toString());
        await _googleSignIn.signOut();
        if (user != null) {
          Get.offAllNamed(Routes.HOME_NAVBAR);
        } else {
          Get.back();
          Get.snackbar("Oops!", "Terjadi Kesalahan Server");
        }
      }
    } catch (error, stackTrace) {
      Get.back();
      Get.snackbar("Oops!", error.toString());
      log(error.toString(), stackTrace: stackTrace);
    }
  }
}
