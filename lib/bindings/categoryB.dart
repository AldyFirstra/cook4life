import 'package:get/get.dart';
import 'package:tugas_akhir/controllers/categoryC.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
  }
}
