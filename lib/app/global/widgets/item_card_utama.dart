import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';
import 'package:tugas_akhir/app/modules/home/controllers/resep_controller.dart';

import '../../data/repository/resep_repository.dart';

class ItemCardUtama extends StatelessWidget {
  final Resep? resep;

  const ItemCardUtama({Key? key, this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsetsDirectional.only(end: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 2.0),
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 300,
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: resep != null ? null : Colors.grey,
              image: resep != null
                  ? DecorationImage(
                      image: NetworkImage(resep!.foto), fit: BoxFit.cover)
                  : null,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            resep != null ? resep!.nama : "Memuat",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 12,
              ),
            ),
          ),
          const Spacer(),
          resep != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Row(
                        children: [
                          FaIcon(
                            resep!.meRating > 0
                                ? FontAwesomeIcons.solidStar
                                : FontAwesomeIcons.star,
                            size: 12,
                            color: resep!.meRating > 0 ? Colors.amber : null,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(resep!.allRatingCount.toString()),
                          const SizedBox(
                            width: 12,
                          ),
                          FaIcon(
                            resep!.isLiked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            size: 12,
                            color: resep!.isLiked ? Colors.amber : null,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(resep!.like.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomRight,
                      child: resep != null
                          ? IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    isDismissible: false,
                                    context: context,
                                    builder: (context) => SizedBox(
                                          height: Get.height / 4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox.shrink(),
                                              Text(
                                                  resep!.isFav
                                                      ? "Hapus dari favorit?"
                                                      : "Simpan resep ini?",
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
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
                                                        try {
                                                          ResepRepository
                                                              .instance
                                                              .favoriteResep(
                                                                  resep!.id)
                                                              .then((value) {
                                                            Get.back();
                                                            Get.find<
                                                                    ResepController>()
                                                                .getListResep();
                                                          });
                                                        } catch (e) {
                                                          log(e.toString());
                                                        }
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(12),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration: BoxDecoration(
                                                            color: Colors.amber,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                        child: Center(
                                                          child: Text(
                                                              resep!.isFav
                                                                  ? "Hapus"
                                                                  : "Simpan",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
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
                                                              const EdgeInsets
                                                                  .all(12),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .amber),
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
                                                                  color: Colors
                                                                      .black,
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
                              icon: const Icon(Icons.more_horiz),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
