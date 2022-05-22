import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/repository/resep_repository.dart';

import '../../../data/models/toko.dart';

class ListTokoController extends GetxController with StateMixin<List<Toko>?> {
  TextEditingController textSearch = TextEditingController();
  List<Toko> current = [];
  @override
  void onReady() {
    getListToko();
    textSearch.addListener(() {
      searchToko();
    });
    super.onReady();
  }

  @override
  void onClose() {
    textSearch.dispose();
    super.onClose();
  }

  void searchToko() {
    change(null, status: RxStatus.loading());
    if (current.isEmpty) {
      change([], status: RxStatus.empty());
    } else {
      if (textSearch.text.isEmpty) {
        change(current, status: RxStatus.success());
      } else {
        change(
            current
                .where((element) =>
                    element.nama_toko
                        .isCaseInsensitiveContainsAny(textSearch.text) ||
                    element.alamat
                        .isCaseInsensitiveContainsAny(textSearch.text))
                .toList(),
            status: RxStatus.success());
      }
    }
  }

  void getListToko() {
    change(null, status: RxStatus.loading());
    try {
      ResepRepository.instance.getListToko().then((value) {
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
      change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
    }
  }
}
