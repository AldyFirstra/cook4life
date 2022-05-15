import 'package:tugas_akhir/app/data/api/network.dart';

class Kategori {
  int id;
  String nama;
  String foto;

  Kategori({required this.foto, required this.id, required this.nama});

  factory Kategori.fromMap(Map map) {
    return Kategori(
        foto: ApiConfig.BASE_URL + map['foto'],
        id: map['id'],
        nama: map['nama_kategori']);
  }
}
