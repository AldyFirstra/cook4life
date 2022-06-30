import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/global/widgets/item_card_grid.dart';
import 'package:tugas_akhir/app/modules/home/controllers/resep_controller.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

import '../controllers/category_hasil_controller.dart';

class CategoryHasilView extends GetView<CategoryHasilController> {
  const CategoryHasilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.amber),
        title: Text(
          "Hasil Pencarian",
          style: GoogleFonts.poppins(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(5),
        color: Colors.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.bottomSheet(Container(
                      height: Get.height * 0.4,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "Sortir",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              controller.sortir.value = "Abjad";
                              controller.sort(1);
                            },
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Abjad"),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.sortir.value =
                                  "Rating tertinggi - Rating terendah";
                              controller.sort(2);
                            },
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      "Rating tertinggi - Rating terendah"),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.sortir.value =
                                  "Rating terendah - Rating tertinggi";

                              controller.sort(3);
                            },
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                      "Rating terendah - Rating tertinggi"),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.sortir.value =
                                  "Harga tertinggi - Harga terendah";

                              controller.sort(4);
                            },
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                      Text("Harga tertinggi - Harga terendah"),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.sortir.value =
                                  "Harga terendah - Harga tertinggi";

                              controller.sort(5);
                            },
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                      Text("Harga terendah - Harga tertinggi"),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
                  },
                  child: Obx(
                    () => Container(
                      width: controller.sortir.contains('-')
                          ? Get.width * 0.8
                          : Get.width * 0.5,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.amber)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.sort,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Obx(() => Text(
                                controller.sortir.value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                controller.obx(
                    (state) => GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.3),
                          ),
                          itemCount: state!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(Routes.DETAIL_MASAKAN,
                                      arguments: state[index])!
                                  .then((value) => Get.find<RekomendasiResep>()
                                      .getListResep()),
                              child: ItemCardGrid(resep: state[index]),
                            );
                          },
                        ),
                    onLoading: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.375),
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const ItemCardGrid();
                      },
                    ),
                    onEmpty: SizedBox(
                      height: Get.height / 2,
                      child: const Center(
                        child: Text(
                          "Tidak ada resep tersedia",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
