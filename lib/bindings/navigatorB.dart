import 'package:get/get.dart';
import 'package:tugas_akhir/controllers/navigatorC.dart';
class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorController>(
      () => NavigatorController(),
    );
  }
}