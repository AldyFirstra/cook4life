import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';

import '../../../data/repository/resep_repository.dart';

class CategoryController extends GetxController
    with StateMixin<List<Kategori>?> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    ResepRepository.instance.getListKategori().then((value) {
      if (value != null) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("Kesalahan Server"));
      }
    });
    super.onInit();
  }
}
