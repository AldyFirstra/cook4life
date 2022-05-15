// ignore_for_file: non_constant_identifier_names

import 'package:tugas_akhir/app/data/models/user.dart';

class Toko {
  int id;
  User user;
  String nama_toko;
  String alamat;
  String latitude;
  String longitude;
  String no_telp;

  Toko(
      {required this.id,
      required this.alamat,
      required this.latitude,
      required this.longitude,
      required this.nama_toko,
      required this.no_telp,
      required this.user});

  factory Toko.fromMap(Map map) {
    return Toko(
        id: map['id'],
        alamat: map['alamat'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        nama_toko: map['nama_toko'],
        no_telp: map['no_telp'],
        user: User.fromMap(map['user']));
  }
}
