import 'package:get/get.dart';

import '../controllers/tambah_toko_controller.dart';

class TambahTokoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahTokoController>(
      () => TambahTokoController(),
    );
  }
}
