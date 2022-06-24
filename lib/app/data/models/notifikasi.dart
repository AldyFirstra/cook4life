// ignore_for_file: non_constant_identifier_names

import '../api/network.dart';

class Notifikasi {
  int id;
  String foto;
  String title;
  String created_at;

  Notifikasi(
      {required this.foto,
      required this.id,
      required this.title,
      required this.created_at});

  factory Notifikasi.fromMap(Map map) {
    return Notifikasi(
        foto: ApiConfig.BASE_URL_STORAGE +
            map['resep']['foto'].toString().replaceAll('storage', ''),
        id: map['id'],
        title: map['title'],
        created_at: map['created_at']);
  }
}
