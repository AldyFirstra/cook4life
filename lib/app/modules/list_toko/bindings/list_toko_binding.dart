import 'package:get/get.dart';

import '../controllers/list_toko_controller.dart';

class ListTokoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTokoController>(
      () => ListTokoController(),
    );
  }
}
