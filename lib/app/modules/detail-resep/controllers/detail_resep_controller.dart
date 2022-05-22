import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

class DetailResepController extends GetxController {
  Kategori argument = Get.arguments;
  Rx<XFile?> image = Rx(null);

  ResepInput resep = ResepInput();

  final formKey = GlobalKey<FormState>();

  TextEditingController namaMakasakanController = TextEditingController();
  TextEditingController deskripsiMasakanController = TextEditingController();

  Future<void> getImageGallery() async {
    image.value = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<void> getImageCamera() async {
    image.value = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  void berikutnya() {
    if (formKey.currentState?.validate() ?? false) {
      if (image.value == null) {
        Get.snackbar("Oops!", "Gambar tidak boleh kosong");
      } else {
        resep.deskripsi = deskripsiMasakanController.text;
        resep.nama = namaMakasakanController.text;
        resep.foto = File(image.value!.path);
        resep.kategori = argument;
        Get.toNamed(Routes.DETAIL_RESEP2, arguments: resep);
      }
    }
  }

  @override
  void onClose() {
    namaMakasakanController.dispose();
    deskripsiMasakanController.dispose();
    super.onClose();
  }
}
