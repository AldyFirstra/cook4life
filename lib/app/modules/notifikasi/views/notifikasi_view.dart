import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(5),
        color: Colors.white,
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getListNotif();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                            "Notifikasi",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              color: Colors.amber,
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
                  controller.obx((state) => Column(
                        children: [
                          for (var item in state!)
                            Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(item.foto),
                                ),
                                title: Text(
                                  item.title,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      item.created_at
                                          .replaceAll("T", " ")
                                          .split('.')[0],
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
