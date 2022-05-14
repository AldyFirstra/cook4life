class Kategori {
  int id;
  String nama;
  String foto;

  Kategori({required this.foto, required this.id, required this.nama});

  factory Kategori.fromMap(Map map) {
    return Kategori(foto: map['foto'], id: map['id'], nama: map['nama']);
  }
}
