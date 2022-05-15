import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/toko.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

class DetailResep2Controller extends GetxController {
  final _bahanCount = 1.obs;
  int get bahanCount => _bahanCount.value;

  final formKey = GlobalKey<FormState>();

  Map<int, Map<String, TextEditingController>> textController = {
    1: {
      'nama': TextEditingController(),
      'harga': TextEditingController(),
      'toko': TextEditingController()
    }
  };

  List<Toko?> toko = [null];

  void tambahBahan() {
    _bahanCount.value++;
    textController[bahanCount] = {
      'nama': TextEditingController(),
      'harga': TextEditingController(),
      'toko': TextEditingController()
    };
    toko.add(null);
  }

  void kurangBahan() {
    if (bahanCount > 1) {
      textController[bahanCount]?['nama']?.dispose();
      textController[bahanCount]?['harga']?.dispose();
      textController[bahanCount]?['toko']?.dispose();
      _bahanCount.value--;
      toko.removeAt(toko.length - 1);
    }
  }

  Future<void> pilihToko(int index) async {
    Get.toNamed(Routes.LIST_TOKO)!.then((result) {
      if (result != null) {
        toko[index] = result;
        textController[index]?['toko']?.text = result.nama_toko;
      }
    });
  }
}
