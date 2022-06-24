import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/notifikasi.dart';

import '../../../data/repository/resep_repository.dart';

class NotifikasiController extends GetxController
    with StateMixin<List<Notifikasi>?> {
  @override
  void onInit() {
    getListNotif();
    super.onInit();
  }

  void getListNotif() {
    change(null, status: RxStatus.loading());
    try {
      ResepRepository.instance.getListNotif().then((value) {
        if (value == null) {
          change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
        } else {
          if (value.isEmpty) {
            change([], status: RxStatus.empty());
          } else {
            change(value, status: RxStatus.success());
          }
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
    }
  }
}
