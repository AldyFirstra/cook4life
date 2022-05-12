import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/routes/pages.dart';
import 'package:tugas_akhir/widgets/ItemCardGrid.dart';

class CategoryHasilPage extends StatelessWidget {
  const CategoryHasilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.amber),
        title: Text(
          "Hasil Pencarian",
          style: GoogleFonts.poppins(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(5),
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.4),
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(AppPages.DetailMasakan),
                        child: ItemCardGrid(
                        "nama ${index}", "https://picsum.photos/200"),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
