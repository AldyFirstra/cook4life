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
  String deskripsi;
  String foto;

  Resep(
      {required this.id,
      required this.kategori,
      required this.nama,
      required this.deskripsi,
      required this.foto,
      required this.user,
      this.bahan,
      this.langkah});

  factory Resep.fromMap(Map map) {
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
    );
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
  File? foto;

  ResepInput({this.kategori, this.nama, this.deskripsi, this.foto});

  toMap() => {
        'nama_resep': nama,
        'kategori_id': kategori!.id,
        'deskripsi': deskripsi,
        'foto': foto
      };
}
