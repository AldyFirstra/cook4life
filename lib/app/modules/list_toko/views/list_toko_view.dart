// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

import '../controllers/list_toko_controller.dart';

class ListTokoView extends GetView<ListTokoController> {
  const ListTokoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () => Get.toNamed(Routes.TAMBAH_TOKO),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.amber),
          title: Text(
            "Pilih Toko",
            style: GoogleFonts.poppins(
                color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 2.0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        autocorrect: false,
                        decoration: InputDecoration.collapsed(
                          hintText: "Cari toko",
                          hintStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap: () {
                          //Get.back(Toko());
                        },
                        child: tokoWidget(i));
                  }),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }

  Widget tokoWidget(
    int index, {
    String nama = "Nama Toko",
    String alamat = "Jl Pahlawan",
    String no_telp = "088287987676",
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListTile(
          leading: Icon(
            Icons.store,
            color: [
              Colors.amber,
              Colors.red,
              Colors.greenAccent,
              Colors.pink,
              Colors.purple
            ][index % 5],
          ),
          title: Text(nama),
          subtitle: Text(alamat + '\n' + no_telp),
          trailing: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.redAccent),
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
