import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';
import 'package:tugas_akhir/app/data/repository/auth_repository.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_masakan_controller.dart';

class DetailMasakanView extends GetView<DetailMasakanController> {
  const DetailMasakanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.amber),
        title: Text(
          controller.arguments.kategori!.nama,
          style: GoogleFonts.poppins(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          controller.arguments.user!.id == Get.find<AppController>().user!.id
              ? PopupMenuButton(
                  onSelected: (value) {
                    if (value.toString().contains("hapus")) {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Column(
                                  children: [
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24),
                                      alignment: Alignment.bottomCenter,
                                      width: Get.width,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                              "Apakah anda ingin menghapus resep ini?"),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                    controller.hapusResep(
                                                        controller
                                                            .arguments.id);
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
                                                      child: Text("Hapus",
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
                                    ),
                                  ],
                                ),
                              ));
                    } else {
                      Get.toNamed(Routes.DETAIL_RESEP,
                          arguments: controller.arguments);
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            value: "edit",
                            child: Row(
                              children: const [
                                Icon(Icons.edit),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("Edit"),
                              ],
                            )),
                        PopupMenuItem(
                            value: "hapus",
                            child: Row(
                              children: const [
                                Icon(Icons.delete),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("Hapus"),
                              ],
                            )),
                      ])
              : const SizedBox.shrink()
        ],
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: controller.obx((state) => detailMasakan(state),
              onLoading: detailMasakanLoading(),
              onError: (e) => Center(
                    child: Text(e.toString()),
                  ))),
    );
  }

  Column detailMasakan(Resep? state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            image: DecorationImage(
              image: NetworkImage(state!.foto),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Pemisah(),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.nama,
                    style: GoogleFonts.poppins(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        modalRating(state);
                      },
                      icon: FaIcon(
                        state.meRating > 0
                            ? FontAwesomeIcons.solidStar
                            : FontAwesomeIcons.star,
                        color: state.meRating > 0 ? Colors.amber : null,
                      )),
                  IconButton(
                      onPressed: () {
                        modalKomentar(state);
                      },
                      icon: const FaIcon(FontAwesomeIcons.comment)),
                  IconButton(
                      onPressed: () {
                        controller.likeResep();
                      },
                      icon: FaIcon(
                        state.isLiked
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        color: state.isLiked ? Colors.amber : null,
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(state.user!.foto),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    state.user!.name,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Rp " +
                          List.generate(state.bahan!.length,
                                  (index) => state.bahan![index].hargaBahan)
                              .reduce((value, element) => value + element)
                              .toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Pemisah(),
              const SizedBox(
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
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    state.deskripsi,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Pemisah(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bahan - bahan",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (var i = 0; i < state.bahan!.length; i++)
                        Card(
                          child: ListTile(
                            onTap: () async {
                              if (!await launchUrl(Uri.parse(
                                  "https://maps.google.com/?q=${state.bahan![i].toko?.latitude},${state.bahan![i].toko?.longitude}"))) {
                                Get.snackbar("Oops!", "Tidak menemukan toko");
                              }
                            },
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${i + 1}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              state.bahan![i].namaBahan,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            subtitle: Text(
                              "Rp " + state.bahan![i].hargaBahan.toString(),
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            trailing: const Icon(Icons.location_on),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Pemisah(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Langkah - langkah",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (var i = 0; i < state.langkah!.length; i++)
                        Card(
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${i + 1}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              state.langkah![i].waktu.toString() + " Menit",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            subtitle: Text(
                              state.langkah![i].deskripsi,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Card userComment(Komentar komentar) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(komentar.user.foto),
        ),
        title: Text(
          komentar.user.name,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          komentar.komentar,
          style: GoogleFonts.poppins(
            color: Colors.black,
          ),
        ),
        isThreeLine: true,
      ),
    );
  }

  Card userRating(Rating rating) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(rating.user.foto),
        ),
        title: Text(
          rating.user.name,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: RatingBarIndicator(
          itemSize: 24,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          rating: rating.rating.toDouble(),
        ),
      ),
    );
  }

  Column detailMasakanLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Pemisah(),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(color: Colors.grey[200]),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.star)),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.comment)),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.heart)),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(color: Colors.grey[200]),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(color: Colors.grey[200]),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Pemisah(),
              const SizedBox(
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
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Memuat",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Pemisah(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bahan - bahan",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (var i = 0; i < 4; i++)
                        Card(
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${i + 1}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              "Memuat",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            trailing: const Icon(Icons.location_on),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Pemisah(),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Langkah - langkah",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (var i = 0; i < 4; i++)
                        Card(
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${i + 1}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            title: Text(
                              "Memuat",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  modalRating(Resep state) {
    showModalBottomSheet(
        context: Get.context!,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  RatingBar.builder(
                    initialRating: state.meRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.ratingResep(rating);
                    },
                  ),
                  SizedBox(
                    height: Get.height / 2.5,
                    child: state.allRating.isEmpty
                        ? const Center(
                            child: Text("Belum ada rating"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.allRating.length,
                            itemBuilder: (context, i) {
                              return userRating(state.allRating[i]);
                            }),
                  )
                ],
              ),
            ));
  }

  modalKomentar(Resep state) {
    showModalBottomSheet(
        context: Get.context!,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: Get.height / 2,
                width: Get.width,
                child: Stack(
                  children: [
                    Visibility(
                      visible: MediaQuery.of(context).viewInsets.bottom < 1,
                      child: Positioned(
                        top: 0,
                        child: SizedBox(
                          height: Get.height / 2.5,
                          width: Get.width,
                          child: state.komentar.isEmpty
                              ? const Center(
                                  child: Text("Belum ada Komentar"),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.komentar.length,
                                  itemBuilder: (context, i) {
                                    return userComment(state.komentar[i]);
                                  }),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 80,
                        width: Get.width,
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                autocorrect: false,
                                controller: controller.komentarController,
                                textInputAction: TextInputAction.done,
                                validator: (val) {
                                  if (val?.isEmpty ?? true) {
                                    return "Komentar tidak boleh kosong";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Komentar",
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                controller.komentarResep();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.amber),
                                child: const Icon(Icons.send),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
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
