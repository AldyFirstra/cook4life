import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';
import 'package:tugas_akhir/app/data/repository/resep_repository.dart';

class ResepController extends GetxController with StateMixin<List<Resep>?> {
  List<Resep> current = [];

  @override
  void onInit() {
    getListResep();
    super.onInit();
  }

  void getListResep() {
    change(null, status: RxStatus.loading());
    try {
      ResepRepository.instance.getListResep().then((value) {
        current.clear();
        if (value == null) {
          change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
        } else {
          if (value.isEmpty) {
            change([], status: RxStatus.empty());
          } else {
            current.addAll(value);
            Get.find<RekomendasiResep>().getListResep();
            change(value, status: RxStatus.success());
          }
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error("Terjadi Kesalahan Server"));
    }
  }
}

class RekomendasiResep extends GetxController with StateMixin<List<Resep>?> {
  List<Resep> current = [];

  void getListResep() {
    change(null, status: RxStatus.loading());
    try {
      ResepRepository.instance.getHistory().then((value) {
        current.clear();
        if (value == null) {
          change([], status: RxStatus.empty());
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
