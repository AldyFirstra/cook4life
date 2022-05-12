import 'package:get/get.dart';
import 'package:tugas_akhir/controllers/homeC.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
