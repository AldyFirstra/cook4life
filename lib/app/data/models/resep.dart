// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:tugas_akhir/app/data/api/network.dart';
import 'package:tugas_akhir/app/data/models/toko.dart';

import 'kategori.dart';
import 'user.dart';

class Resep {
  int id;
  String nama;
  Kategori? kategori;
  User? user;
  List<Bahan>? bahan;
  List<Langkah>? langkah;
  List<Komentar> komentar;
  String deskripsi;
  String foto;
  int like;
  bool isLiked;
  int favorite;
  bool isFav;
  double meRating;
  double allRatingCount;
  List<Rating> allRating;
  String? social;

  Resep(
      {required this.id,
      required this.kategori,
      required this.nama,
      required this.deskripsi,
      required this.foto,
      required this.user,
      required this.like,
      required this.isLiked,
      required this.favorite,
      required this.isFav,
      required this.meRating,
      required this.allRatingCount,
      this.social,
      this.bahan,
      this.langkah,
      this.komentar = const [],
      required this.allRating});

  factory Resep.fromMap(Map map) {
    double rat = 0;
    if (map['allrating'] != null) {
      if (map['allrating'].isNotEmpty) {
        List listRat = map['allrating'];
        var allrat =
            List.generate(listRat.length, (index) => listRat[index]['rating']);
        var result = allrat.reduce((value, element) => value + element);
        rat = result is double ? result : (result as int).toDouble();
        rat = rat / listRat.length;
      }
    }
    return Resep(
        id: map['id'],
        kategori:
            map['kategori'] != null ? Kategori.fromMap(map['kategori']) : null,
        nama: map['nama_resep'],
        deskripsi: map['deskripsi'],
        foto: ApiConfig.BASE_URL_STORAGE +
            map['foto'].toString().replaceAll('storage', ''),
        user: map['user'] != null ? User.fromMap(map['user']) : null,
        bahan: map['bahan'] != null
            ? List.generate((map['bahan'] as List).length,
                (index) => Bahan.fromMap(map['bahan'][index]))
            : null,
        langkah: map['langkah'] != null
            ? List.generate((map['langkah'] as List).length,
                (index) => Langkah.fromMap(map['langkah'][index]))
            : null,
        like: map['like_count'] ?? 0,
        isLiked: map['like_me_count'] == 1,
        favorite: map['favorit_count'] ?? 0,
        isFav: map['favorit_me_count'] == 1,
        komentar: map['komentar'] != null
            ? List.generate((map['komentar'] as List).length,
                    (index) => Komentar.fromMap(map['komentar'][index]))
                .reversed
                .toList()
            : [],
        meRating: map['rating'] != null
            ? map['rating'].isNotEmpty
                ? (map['rating'][0]?['rating'] as int).toDouble()
                : 0
            : 0,
        allRatingCount: rat.toDouble(),
        allRating: map['allrating'] != null
            ? List.generate((map['allrating'] as List).length,
                (index) => Rating.fromMap(map['allrating'][index]))
            : [],
        social: map['social']);
  }
}

class Langkah {
  int id;
  String deskripsi;
  int waktu;

  Langkah({required this.id, required this.deskripsi, required this.waktu});

  factory Langkah.fromMap(Map map) {
    return Langkah(
        id: map['id'], deskripsi: map['deskripsi'], waktu: map['waktu']);
  }
}

class Bahan {
  String namaBahan;
  int hargaBahan;
  Toko? toko;

  Bahan({required this.hargaBahan, required this.namaBahan, this.toko});

  factory Bahan.fromMap(Map map) {
    return Bahan(
        hargaBahan: map['harga'],
        namaBahan: map['nama_bahan'],
        toko: map['toko'] != null ? Toko.fromMap(map['toko']) : null);
  }
}

class ResepInput {
  String? nama;
  Kategori? kategori;
  String? deskripsi;
  String? social;
  File? foto;

  ResepInput(
      {this.kategori, this.nama, this.deskripsi, this.foto, this.social});

  toMap() => {
        'nama_resep': nama,
        'kategori_id': kategori!.id,
        'deskripsi': deskripsi,
        'foto': foto,
        'social': social
      };
}

class Komentar {
  int id;
  User user;
  int resep_id;
  String created_at;
  String komentar;

  Komentar(
      {required this.created_at,
      required this.id,
      required this.komentar,
      required this.resep_id,
      required this.user});

  factory Komentar.fromMap(Map map) {
    return Komentar(
        id: map['id'],
        komentar: map['komentar'],
        resep_id: map['resep_id'],
        created_at: map['created_at'],
        user: User.fromMap(map['user']));
  }
}

class Rating {
  int id;
  User user;
  int rating;
  int resep_id;

  Rating(
      {required this.id,
      required this.rating,
      required this.resep_id,
      required this.user});
  factory Rating.fromMap(Map map) {
    return Rating(
        id: map['id'],
        rating: map['rating'],
        resep_id: map['resep_id'],
        user: User.fromMap(map['user']));
  }
}
