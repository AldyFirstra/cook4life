import 'package:get/get.dart';
import 'package:tugas_akhir/controllers/profileC.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
