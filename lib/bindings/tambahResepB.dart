import 'package:get/get.dart';
import 'package:tugas_akhir/controllers/tambaResepC.dart';

class TambahResepBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TambahResepController>(
      () => TambahResepController(),
    );
  }
}
