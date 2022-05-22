// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:tugas_akhir/app/data/api/network.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';

import '../../models/toko.dart';

class ResepServices {
  ResepServices._();
  static final ResepServices _instance = ResepServices._();
  static ResepServices get instance => _instance;

  final _resep = '/api/resep';
  final _kategori = '/api/kategori';
  final _toko = '/api/toko';

  Future<List<Resep>?> getListResep() async {
    var response = await API.get(_resep);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return (body['data'] as List).map((e) => Resep.fromMap(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Resep>?> getListResepByQuery(
      {required Map<String, String> query}) async {
    var response = await API.get(_resep, queryParameters: query);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return (body['data'] as List).map((e) => Resep.fromMap(e)).toList();
    } else {
      return null;
    }
  }

  Future<List<Resep>?> getListRekomendasi() async {
    var response = await API.get(_resep + '/rekomendasi');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((e) => Resep.fromMap(e)).toList();
    } else {
      return null;
    }
  }

  Future<Resep?> tambahResep({
    required String nama_resep,
    required int kategori_id,
    required String deskripsi,
    required File foto,
    required List<Map<String, dynamic>> bahan,
    required List<Map<String, dynamic>> langkah,
  }) async {
    var body = {
      'nama_resep': nama_resep,
      'kategori_id': kategori_id,
      'deskripsi': deskripsi,
    };
    for (int i = 0; i < bahan.length; i++) {
      bahan[i].forEach((key, value) {
        body['bahan[$i][$key]'] = value;
      });
    }
    for (int i = 0; i < langkah.length; i++) {
      langkah[i].forEach((key, value) {
        body['langkah[$i][$key]'] = value;
      });
    }
    var response = await API
        .mulipartRequest(_resep, "POST", body: body, file: {'foto': foto});
    if (response.statusCode == 201) {
      final body = json.decode(response.body);
      return Resep.fromMap(body['data']);
    }
    return null;
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

  Future<List<Toko>?> getListToko() async {
    var response = await API.get(_toko);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return (body['data'] as List).map((e) => Toko.fromMap(e)).toList();
    } else {
      return null;
    }
  }

  Future<Toko?> tambahToko(
      {required String namaToko,
      required String alamat,
      required double latitude,
      required double longitude,
      required String nomorTelpon}) async {
    var response = await API.post(_toko, body: {
      'nama_toko': namaToko,
      'alamat': alamat,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'no_telp': nomorTelpon
    });
    if (response.statusCode == 201) {
      Map<String, dynamic> body = json.decode(response.body);
      return Toko.fromMap(body['data']);
    } else {
      return null;
    }
  }
}
