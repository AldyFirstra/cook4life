import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';
import 'package:tugas_akhir/app/modules/category/controllers/category_controller.dart';
import 'package:tugas_akhir/app/modules/home/controllers/resep_controller.dart';

class HomeController extends GetxController {
  final AppController app = Get.find();
  final CategoryController kategori = Get.find();
  final ResepController resep = Get.put(ResepController());
  final RekomendasiResep resepRekom = Get.put(RekomendasiResep());
  TextEditingController search = TextEditingController();

  @override
  void onClose() {
    Get.delete<ResepController>();
    Get.delete<RekomendasiResep>();
    search.dispose();
    super.onClose();
  }
}
