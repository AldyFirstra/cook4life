import 'dart:developer';

import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';

import '../../../data/repository/resep_repository.dart';

class CategoryHasilController extends GetxController
    with StateMixin<List<Resep>?> {
  List<Resep> current = [];

  @override
  void onInit() {
    getListResep();
    super.onInit();
  }

  void getListResep() {
    change(null, status: RxStatus.loading());
    try {
      ResepRepository.instance
          .getListResepByQuery(query: Get.arguments)
          .then((value) {
        current.clear();
        if (value == null) {
          change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
        } else {
          if (value.isEmpty) {
            change([], status: RxStatus.empty());
          } else {
            current.addAll(value);
            change(value, status: RxStatus.success());
          }
        }
      });
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
    }
  }
}
