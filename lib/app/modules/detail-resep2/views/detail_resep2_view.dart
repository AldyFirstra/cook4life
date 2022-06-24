import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_resep2_controller.dart';

class DetailResep2View extends GetView<DetailResep2Controller> {
  const DetailResep2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.amber),
        title: Text(
          "Bahan dan Langkah",
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
                Text(
                  "Bahan - bahan",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: Get.width,
                  child: Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.bahanCount,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: Offset(1.0, 2.0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.bahanController[index]
                                    ?['nama'],
                                autocorrect: false,
                                validator: (val) {
                                  if (val?.isEmpty ?? true) {
                                    return "Nama Bahan masakan tidak boleh kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Masukkan bahan",
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                style: GoogleFonts.poppins(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: controller.bahanController[index]
                                    ?['harga'],
                                autocorrect: false,
                                validator: (val) {
                                  if (val?.isEmpty ?? true) {
                                    return "Harga bahan masakan tidak boleh kosong";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Masukkan harga bahan",
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                style: GoogleFonts.poppins(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                autocorrect: false,
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  controller.pilihToko(index);
                                },
                                controller: controller.bahanController[index]
                                    ?['toko'],
                                validator: (val) {
                                  if (val?.isEmpty ?? true) {
                                    return "Tempat beli bahan masakan tidak boleh kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Container(
                                      margin: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Icon(Icons.location_on)),
                                  hintText: "Masukkan tempat beli bahan",
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                style: GoogleFonts.poppins(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              index == controller.bahanCount - 1 && index != 0
                                  ? GestureDetector(
                                      onTap: () => controller.kurangBahan(),
                                      child: Container(
                                        height: 50,
                                        width: Get.width,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Hapus Bahan",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => controller.tambahBahan(),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Tambah Bahan",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Langkah - langkah",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: Get.width,
                  child: Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.langkahCount,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: Offset(1.0, 2.0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: controller.langkahController[index]
                                    ?['deskripsi'],
                                autocorrect: false,
                                validator: (val) {
                                  if (val?.isEmpty ?? true) {
                                    return "Deskripsi langkah masakan tidak boleh kosong";
                                  }
                                  return null;
                                },
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Langkah pembuatan",
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                style: GoogleFonts.poppins(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: controller.langkahController[index]
                                    ?['waktu'],
                                autocorrect: false,
                                validator: (val) {
                                  if (val?.isEmpty ?? true) {
                                    return "waktu masakan tidak boleh kosong";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Masukkan waktu langkah",
                                  suffixText: "Menit",
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                style: GoogleFonts.poppins(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              index == controller.langkahCount - 1 && index != 0
                                  ? GestureDetector(
                                      onTap: () => controller.kurangLangkah(),
                                      child: Container(
                                        height: 50,
                                        width: Get.width,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Hapus Langkah",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => controller.tambahLangkah(),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Tambah Langkah",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => controller.resep != null
                      ? controller.updateResep()
                      : controller.tambahResep(),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Simpan",
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
