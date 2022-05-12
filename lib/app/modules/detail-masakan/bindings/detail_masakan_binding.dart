import 'package:get/get.dart';

import '../controllers/detail_masakan_controller.dart';

class DetailMasakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMasakanController>(
      () => DetailMasakanController(),
    );
  }
}
