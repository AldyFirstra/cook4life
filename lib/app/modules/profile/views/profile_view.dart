import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/data/utils/service_preferences.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

import '../../../data/models/resep.dart';
import '../../../global/widgets/item_card_grid.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/resep_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                      height: Get.height / 6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Apakah anda ingin keluar?",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 12,
                                              ))),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    PreferenceService.instance
                                                        .clear();
                                                    Get.offAllNamed(
                                                        Routes.LOGIN);
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            12),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.amber,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Center(
                                                      child: Text("Keluar",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  textStyle:
                                                                      const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                          ))),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              12),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.amber),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                      child: Center(
                                                        child: Text("Batal",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    textStyle:
                                                                        const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                            ))),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.signOutAlt,
                            color: Colors.amber,
                          )),
                    ],
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        NetworkImage(Get.find<AppController>().user!.foto),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    Get.find<AppController>().user!.name,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              )),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () => controller.tab = 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              const FaIcon(
                                FontAwesomeIcons.user,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Obx(() => controller.tab == 0
                                  ? Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          height: 4,
                                          color: Colors.amber,
                                        ))
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 4,
                                    ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () => controller.tab = 1,
                          child: Column(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.heart,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Obx(() => controller.tab == 1
                                  ? Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          height: 4,
                                          color: Colors.amber,
                                        ))
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 4,
                                    ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: RefreshIndicator(
                          onRefresh: () async {
                            controller.resep.getListResep();
                          },
                          child: controller.resep.obx(
                              (state) => Obx(
                                    () {
                                      var resep = controller.tab == 0
                                          ? controller.resepme(state!)
                                          : controller.reseplike(state!);
                                      return GridView.builder(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        shrinkWrap: true,
                                        itemCount: resep.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10.0,
                                          crossAxisSpacing: 10.0,
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.4),
                                        ),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () => Get.toNamed(
                                                    Routes.DETAIL_MASAKAN,
                                                    arguments: resep[index])!
                                                .then((value) =>
                                                    Get.find<RekomendasiResep>()
                                                        .getListResep()),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: ItemCardGrid(
                                                  resep: resep[index]),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                              onLoading: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                shrinkWrap: true,
                                itemCount: 10,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.4),
                                ),
                                itemBuilder: (context, index) {
                                  return const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: ItemCardGrid(),
                                  );
                                },
                              ))))
                ],
              ))
        ],
      )),
    );
  }
}
