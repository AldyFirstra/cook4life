import 'kategori.dart';
import 'user.dart';

class Resep {
  int id;
  String nama;
  Kategori kategori;
  User user;
  String deskripsi;
  String foto;

  Resep(
      {required this.id,
      required this.kategori,
      required this.nama,
      required this.deskripsi,
      required this.foto,
      required this.user});

  factory Resep.fromMap(Map map) {
    return Resep(
        id: map['id'],
        kategori: Kategori.fromMap(map['kategori']),
        nama: map['nama'],
        deskripsi: map['deskripsi'],
        foto: map['foto'],
        user: User.fromMap(map['user']));
  }
}
