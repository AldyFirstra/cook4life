import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/toko.dart';
import 'package:tugas_akhir/app/data/repository/resep_repository.dart';
import 'package:tugas_akhir/app/extra/widget.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

import '../../../data/models/resep.dart';

class DetailResep2Controller extends GetxController {
  final _bahanCount = 1.obs;
  int get bahanCount => _bahanCount.value;
  final _langkahCount = 1.obs;
  int get langkahCount => _langkahCount.value;

  ResepInput resepInput = Get.arguments;

  final formKey = GlobalKey<FormState>();

  Map<int, Map<String, TextEditingController>> bahanController = {
    0: {
      'nama': TextEditingController(),
      'harga': TextEditingController(),
      'toko': TextEditingController()
    }
  };
  Map<int, Map<String, TextEditingController>> langkahController = {
    0: {'deskripsi': TextEditingController(), 'waktu': TextEditingController()}
  };

  List<Toko?> toko = [null];

  void tambahBahan() {
    bahanController[bahanCount] = {
      'nama': TextEditingController(),
      'harga': TextEditingController(),
      'toko': TextEditingController()
    };
    _bahanCount.value++;
    toko.add(null);
  }

  void kurangBahan() {
    if (bahanCount > 1) {
      _bahanCount.value--;
      bahanController[bahanCount]?['nama']?.dispose();
      bahanController[bahanCount]?['harga']?.dispose();
      bahanController[bahanCount]?['toko']?.dispose();
      toko.removeAt(toko.length - 1);
    }
  }

  void tambahLangkah() {
    langkahController[langkahCount] = {
      'deskripsi': TextEditingController(),
      'waktu': TextEditingController()
    };
    _langkahCount.value++;
  }

  @override
  void onClose() {
    langkahController.forEach((key, value) {
      value.forEach((key, value) {
        value.dispose();
      });
    });
    bahanController.forEach((key, value) {
      value.forEach((key, value) {
        value.dispose();
      });
    });
    super.onClose();
  }

  void kurangLangkah() {
    if (langkahCount > 1) {
      _langkahCount.value--;
      langkahController[langkahCount]?['deskripsi']?.dispose();
      langkahController[langkahCount]?['waktu']?.dispose();
    }
  }

  Future<void> pilihToko(int index) async {
    Get.toNamed(Routes.LIST_TOKO)!.then((result) {
      if (result != null) {
        toko[index] = result;
        bahanController[index]?['toko']?.text = result.nama_toko;
      }
    });
  }

  Future<void> tambahResep() async {
    try {
      if (formKey.currentState!.validate()) {
        Custom.loading();
        var res = await ResepRepository.instance.tambahResep(
            nama_resep: resepInput.nama!,
            kategori_id: resepInput.kategori!.id,
            deskripsi: resepInput.deskripsi!,
            foto: resepInput.foto!,
            bahan: List.generate(
                bahanCount,
                (index) => {
                      'toko_id': toko[index]!.id,
                      'nama_bahan': bahanController[index]?['nama']!.text,
                      'harga': bahanController[index]?['harga']!.text,
                    }),
            langkah: List.generate(
                langkahCount,
                (index) => {
                      'deskripsi': langkahController[index]?['deskripsi']!.text,
                      'waktu': langkahController[index]?['waktu']!.text
                    }));
        if (res != null) {
          Get.until((route) => Get.currentRoute == Routes.HOME_NAVBAR);
          Get.snackbar("Yess!", "Resep Berhasil ditambah");
        } else {
          Get.snackbar("Oops!", "Resep gagal ditambah");
        }
      }
    } catch (e, stackTrace) {
      Get.snackbar("Oops!", "Resep gagal ditambah");
      log(e.toString(), stackTrace: stackTrace);
    }
  }
}
