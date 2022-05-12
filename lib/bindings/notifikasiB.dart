import 'package:get/get.dart';
import 'package:tugas_akhir/controllers/notifikasiC.dart';

class NotifikasiBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NotifikasiController>(
      () => NotifikasiController(),
    );
  }
}
