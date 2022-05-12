import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMasakanPage extends StatelessWidget {
  const DetailMasakanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.amber),
        title: Text(
          "Nama Masakan",
          style: GoogleFonts.poppins(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/300"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pemisah(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Nama Masakan",
                        style: GoogleFonts.poppins(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.star)),
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.comment)),
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.heart)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Nama Pengguna",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.amber),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Rp. 999999",
                          style: GoogleFonts.poppins(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Pemisah(),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deskripsi",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec dignissim purus. Vivamus aliquam ante a quam interdum faucibus. Integer lobortis enim aliquet, ornare erat eget, porta sapien. Nullam malesuada quam sit amet lacus elementum iaculis. Praesent mattis leo ut nisi dapibus, sed accumsan leo vulputate.",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Pemisah(),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          Text(
                        "Bahan - bahan",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pemisah extends StatelessWidget {
  const Pemisah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.amber,
      ),
    );
  }
}
