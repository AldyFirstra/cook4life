import 'package:get/get.dart';

import '../controllers/toko_maps_controller.dart';

class TokoMapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokoMapsController>(
      () => TokoMapsController(),
    );
  }
}
