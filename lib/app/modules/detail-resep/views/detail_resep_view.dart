import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_resep_controller.dart';

class DetailResepView extends GetView<DetailResepController> {
  const DetailResepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.amber),
        title: Text(
          controller.argument.nama,
          style: GoogleFonts.poppins(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.getImageGallery(),
                  child: Container(
                    height: 250,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                          offset: Offset(3.0, 4.0),
                        ),
                      ],
                    ),
                    child: Obx(
                      () => controller.image.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.images,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "Tambahkan foto",
                                  style: GoogleFonts.poppins(
                                    color: Colors.amber,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          : Image.file(File(controller.image.value!.path)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => controller.getImageCamera(),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Nama Masakan",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: controller.namaMakasakanController,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Nama masakan tidak boleh kosong";
                    }
                    return null;
                  },
                  cursorRadius: const Radius.circular(12),
                  decoration: InputDecoration(
                    hintText: "Masukkan nama masakan",
                    hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  style: GoogleFonts.poppins(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Deskripsi Masakan",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  controller: controller.deskripsiMasakanController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Deskripsi masakan tidak boleh kosong";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Masukkan deskripsi masakan",
                    hintStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  style: GoogleFonts.poppins(),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => controller.berikutnya(),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Berikutnya",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
