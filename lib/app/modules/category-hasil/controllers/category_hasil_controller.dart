import 'dart:developer';

import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';

import '../../../data/repository/resep_repository.dart';

class CategoryHasilController extends GetxController
    with StateMixin<List<Resep>?> {
  List<Resep> current = [];

  final sortir = "Resep terbaru".obs;

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

  sort(int sort) {
    switch (sort) {
      case 1:
        current.sort(
            (a, b) => a.nama.toLowerCase().compareTo(b.nama.toLowerCase()));
        break;
      case 2:
        current.sort((a, b) => a.allRatingCount.compareTo(b.allRatingCount));
        break;
      case 3:
        current.sort((a, b) => b.allRatingCount.compareTo(a.allRatingCount));
        break;
      case 4:
        current.sort((b, a) {
          return List.generate(
                  a.bahan!.length, (index) => a.bahan![index].hargaBahan)
              .reduce((value, element) => value + element)
              .compareTo(List.generate(
                      b.bahan!.length, (index) => b.bahan![index].hargaBahan)
                  .reduce((value, element) => value + element));
        });
        break;
      case 5:
        current.sort((a, b) {
          return List.generate(
                  a.bahan!.length, (index) => a.bahan![index].hargaBahan)
              .reduce((value, element) => value + element)
              .compareTo(List.generate(
                      b.bahan!.length, (index) => b.bahan![index].hargaBahan)
                  .reduce((value, element) => value + element));
        });
        break;
      default:
    }
    change(current, status: RxStatus.success());
    Get.back();
  }
}
