import 'package:get/get.dart';

import '../controllers/category_hasil_controller.dart';

class CategoryHasilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryHasilController>(
      () => CategoryHasilController(),
    );
  }
}
