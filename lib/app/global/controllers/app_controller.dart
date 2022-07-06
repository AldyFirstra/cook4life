import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/user.dart';

class AppController extends GetxController {
  User? user;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      privacyPolicy();
    });
    super.onInit();
  }

  void privacyPolicy() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Center(
                  child: Text(
                "Pemberitahuan",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Center(
                    child: Text(
                      '''
Aplikasi Cook4life mengumpulkan
data lokasi untuk mendapatkan
lokasi akurat dari pengguna untuk
menambahkan lokasi pembelian
bahan yang diisi oleh pengguna
                            ''',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Center(
                      child: Text(
                        "Okay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
