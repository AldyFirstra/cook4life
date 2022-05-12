import 'package:get/get.dart';

import '../controllers/detail_resep2_controller.dart';

class DetailResep2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailResep2Controller>(
      () => DetailResep2Controller(),
    );
  }
}
