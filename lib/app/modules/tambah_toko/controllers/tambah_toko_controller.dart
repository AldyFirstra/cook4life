import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/repository/resep_repository.dart';
import 'package:tugas_akhir/app/extra/widget.dart';

import '../../../data/models/toko.dart';

class TambahTokoController extends GetxController {
  Rx<double> latitude = (0.0).obs;
  Rx<double> longitude = (0.0).obs;

  final formKey = GlobalKey<FormState>();

  TextEditingController namaToko = TextEditingController();
  TextEditingController alamatToko = TextEditingController();
  TextEditingController nomerTelpon = TextEditingController();
  TextEditingController latlong = TextEditingController();

  @override
  void onClose() {
    namaToko.dispose();
    alamatToko.dispose();
    nomerTelpon.dispose();
    super.onClose();
  }

  Future<void> tambahToko() async {
    try {
      if (formKey.currentState!.validate()) {
        Custom.loading();
        Toko? toko = await ResepRepository.instance.tambahToko(
            namaToko: namaToko.text,
            alamat: alamatToko.text,
            latitude: latitude.value,
            longitude: longitude.value,
            nomorTelpon: nomerTelpon.text);
        Get.back();
        if (toko != null) {
          Get.back(result: true);
          Get.snackbar("Yess!", "Berhasil Menambah Toko");
        } else {
          Get.snackbar("Oops!", "Terjadi Kesalahan Server");
        }
      }
    } catch (e, stackTrace) {
      Get.back();
      log(e.toString(), stackTrace: stackTrace);
      Get.snackbar("Oops!", "Terjadi Kesalahan Server");
    }
  }
}
