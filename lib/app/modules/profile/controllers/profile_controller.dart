import 'package:get/get.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

import '../../../data/models/resep.dart';
import '../../home/controllers/resep_controller.dart';

class ProfileController extends GetxController {
  final Rx<int> _tab = 0.obs;
  set tab(int val) => _tab.value = val;
  int get tab => _tab.value;

  final ResepController resep = Get.put(ResepController());

  List<Resep> resepme(List<Resep> resep) {
    return resep
        .where(
            (element) => element.user!.id == Get.find<AppController>().user!.id)
        .toList();
  }

  List<Resep> reseplike(List<Resep> resep) {
    return resep.where((element) => element.isLiked || element.isFav).toList();
  }
}
