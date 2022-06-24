import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

class DetailResepController extends GetxController {
  Kategori? kategori = Get.arguments is Kategori ? Get.arguments : null;
  Resep? resep = Get.arguments is Resep ? Get.arguments : null;
  Rx<XFile?> image = Rx(null);

  ResepInput resepInput = ResepInput();

  final formKey = GlobalKey<FormState>();

  late TextEditingController namaMakasakanController;
  late TextEditingController deskripsiMasakanController;
  @override
  void onInit() {
    namaMakasakanController = TextEditingController(text: resep?.nama);
    deskripsiMasakanController = TextEditingController(text: resep?.deskripsi);
    super.onInit();
  }

  Future<void> getImageGallery() async {
    image.value = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future<void> getImageCamera() async {
    image.value = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  void berikutnya() {
    if (formKey.currentState?.validate() ?? false) {
      if (resep == null) {
        if (image.value == null) {
          Get.snackbar("Oops!", "Gambar tidak boleh kosong");
        } else {
          resepInput.deskripsi = deskripsiMasakanController.text;
          resepInput.nama = namaMakasakanController.text;
          resepInput.foto = File(image.value!.path);
          resepInput.kategori = kategori;
          Get.toNamed(Routes.DETAIL_RESEP2, arguments: resepInput);
        }
      } else {
        resepInput.deskripsi = deskripsiMasakanController.text;
        resepInput.nama = namaMakasakanController.text;
        resepInput.foto = image.value != null ? File(image.value!.path) : null;
        resepInput.kategori = kategori ?? resep!.kategori;
        Get.toNamed(Routes.DETAIL_RESEP2, arguments: [resep, resepInput]);
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
