import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/global/widgets/item_card_grid.dart';
import 'package:tugas_akhir/app/modules/home/controllers/resep_controller.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(5),
        color: Colors.white,
        child: RefreshIndicator(
          onRefresh: () async {
            controller.resep.getListResep();
            controller.resepRekom.getListResep();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Haloo, ${controller.app.user?.name.split(' ').first ?? ''}",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Mau memasak apa hari ini?",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 70,
                        height: 70,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70 / 2),
                          color: Colors.amber,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                              offset: Offset(1.0, 3.0),
                            ),
                          ],
                        ),
                        child: Image.network(controller.app.user?.foto ?? ''),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
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
                          child: TextFormField(
                            autocorrect: false,
                            controller: controller.search,
                            decoration: InputDecoration.collapsed(
                              hintText: "Cari resep masakan",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.CATEGORY_HASIL,
                              arguments: {'search': controller.search.text}),
                          child: const Icon(
                            Icons.search,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  controller.resepRekom.obx(
                      (state) => Text(
                            "Riwayat resep yang kamu lihat",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                      onEmpty: const SizedBox.shrink(),
                      onError: (e) => const SizedBox.shrink(),
                      onLoading: const SizedBox.shrink()),
                  const SizedBox(
                    height: 15,
                  ),
                  controller.resepRekom.obx(
                      (state) => SizedBox(
                            height: 270,
                            child: ListView.builder(
                              itemCount: state!.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => Get.toNamed(
                                          Routes.DETAIL_MASAKAN,
                                          arguments: state[index])!
                                      .then((value) =>
                                          Get.find<RekomendasiResep>()
                                              .getListResep()),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 12),
                                    child: AspectRatio(
                                        aspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.5),
                                        child:
                                            ItemCardGrid(resep: state[index])),
                                  ),
                                );
                              },
                            ),
                          ),
                      onEmpty: const SizedBox.shrink(),
                      onError: (e) => const SizedBox.shrink(),
                      onLoading: const SizedBox.shrink()),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                    child: controller.kategori.obx(
                        (state) => ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state!.length,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => Get.toNamed(
                                      Routes.CATEGORY_HASIL,
                                      arguments: {
                                        'kategori_id':
                                            state[index].id.toString()
                                      }),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amber,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(1.0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(state[index].foto),
                                    ),
                                  ),
                                );
                              },
                            ),
                        onLoading: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amber,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(1.0, 3.0),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        onError: (message) => Center(
                              child: Text(message!),
                            )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.resep.obx(
                      (state) => GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shrinkWrap: true,
                            itemCount: state!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 1.375),
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => Get.toNamed(Routes.DETAIL_MASAKAN,
                                        arguments: state[index])!
                                    .then((value) =>
                                        Get.find<RekomendasiResep>()
                                            .getListResep()),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ItemCardGrid(resep: state[index]),
                                ),
                              );
                            },
                          ),
                      onLoading: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shrinkWrap: true,
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.4),
                        ),
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: ItemCardGrid(),
                          );
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
