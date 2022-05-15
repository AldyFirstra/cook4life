import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

import '../controllers/tambah_resep_controller.dart';

class TambahResepView extends GetView<TambahResepController> {
  const TambahResepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: Get.width,
      height: Get.height,
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tambah Resep",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Mau menambahkan resep apa nih?",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              controller.obx(
                  (state) => GridView.builder(
                        itemCount: state!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(Routes.DETAIL_RESEP,
                                arguments: state[index]),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(1.0, 3.0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.network(state[index].foto),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 2),
                                        decoration: const BoxDecoration(
                                            color: Colors.amberAccent,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        child: Text(
                                          state[index].nama,
                                          textAlign: TextAlign.center,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  onLoading: GridView.builder(
                    itemCount: 12,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAIL_RESEP),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: Offset(1.0, 3.0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                  onError: (message) => Center(
                        child: Text(message!),
                      ))
            ],
          ),
        ),
      ),
    ));
  }
}
