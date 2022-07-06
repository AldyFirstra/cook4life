import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "Silahkan masuk dengan akun google anda",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.amber),
                ),
                const SizedBox(
                  height: 80,
                ),
                SvgPicture.asset('assets/images/login-icon.svg'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Temukan berbagai resep yang dibagikan oleh sesama pecinta makanan",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => controller.signIn(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo-google.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Masuk dengan Google",
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.find<AppController>().privacyPolicy();
                    },
                    child: const Text(
                      "Kebijakan Privasi",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
