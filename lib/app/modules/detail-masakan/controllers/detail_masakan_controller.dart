import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/extra/widget.dart';
import 'package:tugas_akhir/app/modules/home/controllers/resep_controller.dart';

import '../../../data/models/resep.dart';
import '../../../data/repository/resep_repository.dart';

class DetailMasakanController extends GetxController with StateMixin<Resep?> {
  final Resep arguments = Get.arguments;

  final lihatVideo = false.obs;

  final TextEditingController komentarController = TextEditingController();

  @override
  Future<void> onInit() async {
    // ignore: avoid_print
    print(
        "Menyimpan resep : ${(await ResepRepository.instance.addHistory(arguments.id))}");
    getResep();
    super.onInit();
  }

  void getResep() {
    change(null, status: RxStatus.loading());
    try {
      ResepRepository.instance.getDetailResep(arguments.id).then((value) {
        if (value == null) {
          change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
        } else {
          change(value, status: RxStatus.success());
        }
      });
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
    }
  }

  void likeResep() {
    try {
      ResepRepository.instance.likeResep(arguments.id).then((value) {
        if (value == null) {
          change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
        } else {
          change(value, status: RxStatus.success());
        }
      });
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
    }
  }

  void komentarResep() {
    Get.back();
    if (komentarController.text.isNotEmpty) {
      try {
        ResepRepository.instance
            .komentarResep(arguments.id, komentarController.text)
            .then((value) {
          if (value == null) {
            change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
          } else {
            change(value, status: RxStatus.success());
            komentarController.clear();
          }
        });
      } catch (e) {
        log(e.toString());
        change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
      }
    }
  }

  void ratingResep(double rating) {
    Get.back();
    try {
      ResepRepository.instance
          .ratingResep(arguments.id, rating.toInt().toString())
          .then((value) {
        if (value == null) {
          change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
        } else {
          change(value, status: RxStatus.success());
          komentarController.clear();
        }
      });
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
    }
  }

  void hapusResep(int id) {
    Custom.loading();
    ResepRepository.instance.deleteResep(id).then((value) {
      if (value) {
        Get.back();
        Get.back();
        Get.find<ResepController>().getListResep();
        Get.snackbar("Success!", "Berhasil menghapus resep");
      } else {
        Get.back();
        Get.snackbar("Oops!", "Terjadi kesalahan server");
      }
    });
  }

  @override
  void onClose() {
    komentarController.dispose();
    super.onClose();
  }
}
