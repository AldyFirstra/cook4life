import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/routes/pages.dart';

class DetailResepPage extends StatelessWidget {
  const DetailResepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.amber),
        title: Text(
          "Detail makanan",
          style: GoogleFonts.poppins(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  height: 250,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                        offset: Offset(3.0, 4.0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
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
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FaIcon(
                  FontAwesomeIcons.camera,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Nama Masakan",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                height: 50,
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  autocorrect: false,
                  decoration: InputDecoration.collapsed(
                    hintText: "Masukkan nama masakan",
                    hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  style: GoogleFonts.poppins(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Deskripsi Masakan",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                height: Get.width * 0.5,
                padding: EdgeInsets.all(15),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration.collapsed(
                    hintText: "Masukkan deskripsi masakan",
                    hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  style: GoogleFonts.poppins(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppPages.DetailResep2),
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
    );
  }
}
