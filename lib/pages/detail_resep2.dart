import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailResep2Page extends StatelessWidget {
  const DetailResep2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.amber),
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
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bahan - bahan",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(bottom: 5,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
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
                          Container(
                            width: Get.width,
                            height: 70,
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              autocorrect: false,
                              decoration: InputDecoration.collapsed(
                                hintText: "Masukkan bahan",
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
                            height: 15,
                          ),
                          Container(
                            width: Get.width,
                            height: 70,
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              autocorrect: false,
                              decoration: InputDecoration.collapsed(
                                hintText: "Masukkan harga bahan",
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
                            height: 15,
                          ),
                          Container(
                            width: Get.width,
                            height: 70,
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              autocorrect: false,
                              decoration: InputDecoration.collapsed(
                                hintText: "Masukkan tempat beli bahan",
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
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
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
