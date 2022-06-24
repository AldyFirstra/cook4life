// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:tugas_akhir/app/data/api/network.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';
import 'package:tugas_akhir/app/data/models/notifikasi.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';

import '../../models/toko.dart';

class ResepServices {
  ResepServices._();
  static final ResepServices _instance = ResepServices._();
  static ResepServices get instance => _instance;

  final _resep = '/api/resep';
  final _kategori = '/api/kategori';
  final _toko = '/api/toko';
  final _like = '/api/like';
  final _favorite = '/api/favorite';
  final _komentar = '/api/komentar';
  final _rating = '/api/rating';
  final _notifikasi = '/api/notifikasi';

  Future<List<Resep>?> getListResep() async {
    var response = await API.get(_resep);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return (body['data'] as List).map((e) => Resep.fromMap(e)).toList();
    } else {
      return null;
    }
  }

  Future<Resep?> getDetailResep(int id) async {
    var response = await API.get(_resep + '/$id');
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return Resep.fromMap(body);
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
    var response =
        await API.get(_resep, queryParameters: {'rekomendasi': "true"});
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      if (body is Map) {
        return body.values.map((e) => Resep.fromMap(e)).toList();
      } else if (body is List) {
        return body.map((e) => Resep.fromMap(e)).toList();
      } else {
        return null;
      }
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

  Future<Resep?> updateResep({
    required int id,
    required String nama_resep,
    required int kategori_id,
    required String deskripsi,
    required File? foto,
    required List<Map<String, dynamic>> bahan,
    required List<Map<String, dynamic>> langkah,
  }) async {
    var body = {
      'nama_resep': nama_resep,
      'kategori_id': kategori_id.toString(),
      'deskripsi': deskripsi,
    };
    for (int i = 0; i < bahan.length; i++) {
      bahan[i].forEach((key, value) {
        body['bahan[$i][$key]'] = value.toString();
      });
    }
    for (int i = 0; i < langkah.length; i++) {
      langkah[i].forEach((key, value) {
        body['langkah[$i][$key]'] = value.toString();
      });
    }
    late Response response;
    if (foto != null) {
      response = await API.mulipartRequest("$_resep/$id", "POST",
          body: body, file: {'foto': foto});
    } else {
      response = await API.patch("$_resep/$id", body: body);
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final body = json.decode(response.body);
      return Resep.fromMap(body['data']);
    }
    return null;
  }

  Future<bool> deleteResep(int id) async {
    var response = await API.delete("$_resep/$id");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      return false;
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

  Future<Resep?> likeResep(int resep_id) async {
    var response =
        await API.post(_like, body: {'resep_id': resep_id.toString()});
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> body = json.decode(response.body);
      return Resep.fromMap(body);
    } else {
      return null;
    }
  }

  Future<Resep?> favoriteResep(int resep_id) async {
    var response =
        await API.post(_favorite, body: {'resep_id': resep_id.toString()});
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> body = json.decode(response.body);
      return Resep.fromMap(body);
    } else {
      return null;
    }
  }

  Future<Resep?> komentarResep(int resep_id, String komentar) async {
    var response = await API.post(_komentar,
        body: {'resep_id': resep_id.toString(), 'komentar': komentar});
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> body = json.decode(response.body);
      return Resep.fromMap(body);
    } else {
      return null;
    }
  }

  Future<Resep?> ratingResep(int resep_id, String rating) async {
    var response = await API.post(_rating,
        body: {'resep_id': resep_id.toString(), 'rating': rating});
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> body = json.decode(response.body);
      return Resep.fromMap(body);
    } else {
      return null;
    }
  }

  Future<List<Notifikasi>?> getListNotif() async {
    var response = await API.get(_notifikasi);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return (body['data'] as List).map((e) => Notifikasi.fromMap(e)).toList();
    } else {
      return null;
    }
  }
}
