import 'dart:convert';

import 'package:tugas_akhir/app/data/api/network.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';

class ResepServices {
  ResepServices._();
  static final ResepServices _instance = ResepServices._();
  static ResepServices get instance => _instance;

  final _resep = '/api/resep';
  final _kategori = '/api/kategori';
  Future<List<Resep>?> getListResep() async {
    var response = await API.get(_resep);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return (body['data'] as List).map((e) => Resep.fromMap(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Kategori>?> getListKategori() async {
    var response = await API.get(_kategori);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return (body['data'] as List).map((e) => Kategori.fromMap(e)).toList();
    } else {
      return null;
    }
  }
}
