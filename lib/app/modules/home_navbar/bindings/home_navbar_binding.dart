import 'package:get/get.dart';

import '../controllers/home_navbar_controller.dart';

class HomeNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNavbarController>(
      () => HomeNavbarController(),
    );
  }
}
