// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/api/services/resep_services.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';
import 'package:tugas_akhir/app/data/utils/service_preferences.dart';
import 'package:tugas_akhir/app/modules/home/controllers/resep_controller.dart';

import '../models/notifikasi.dart';
import '../models/resep.dart';
import '../models/toko.dart';

class ResepRepository {
  ResepRepository._();
  static final ResepRepository _instance = ResepRepository._();
  static ResepRepository get instance => _instance;
  final _resepServices = ResepServices.instance;

  Future<List<Resep>?> getListResep() => _resepServices.getListResep();

  Future<List<Kategori>?> getListKategori() => _resepServices.getListKategori();

  Future<Toko?> tambahToko(
          {required String namaToko,
          required String alamat,
          required double latitude,
          required double longitude,
          required String nomorTelpon}) =>
      _resepServices.tambahToko(
          namaToko: namaToko,
          alamat: alamat,
          latitude: latitude,
          longitude: longitude,
          nomorTelpon: nomorTelpon);

  Future<List<Toko>?> getListToko() => _resepServices.getListToko();

  Future<Resep?> tambahResep({
    required String nama_resep,
    required int kategori_id,
    required String deskripsi,
    String? social,
    required File foto,
    required List<Map<String, dynamic>> bahan,
    required List<Map<String, dynamic>> langkah,
  }) =>
      _resepServices.tambahResep(
          nama_resep: nama_resep,
          kategori_id: kategori_id,
          deskripsi: deskripsi,
          foto: foto,
          bahan: bahan,
          social: social,
          langkah: langkah);

  Future<List<Resep>?> getListRekomendasi() =>
      _resepServices.getListRekomendasi();

  Future<List<Resep>?> getListResepByQuery(
          {required Map<String, String> query}) =>
      _resepServices.getListResepByQuery(query: query);
  Future<Resep?> favoriteResep(int resep_id) =>
      _resepServices.favoriteResep(resep_id);

  Future<Resep?> likeResep(int resep_id) => _resepServices.likeResep(resep_id);

  Future<Resep?> getDetailResep(int id) => _resepServices.getDetailResep(id);
  Future<Resep?> komentarResep(int resep_id, String komentar) =>
      _resepServices.komentarResep(resep_id, komentar);

  Future<Resep?> ratingResep(int resep_id, String rating) =>
      _resepServices.ratingResep(resep_id, rating);

  Future<List<Notifikasi>?> getListNotif() => _resepServices.getListNotif();
  Future<Resep?> updateResep({
    required int id,
    required String nama_resep,
    required int kategori_id,
    required String deskripsi,
    String? social,
    required File? foto,
    required List<Map<String, dynamic>> bahan,
    required List<Map<String, dynamic>> langkah,
  }) =>
      _resepServices.updateResep(
          id: id,
          nama_resep: nama_resep,
          kategori_id: kategori_id,
          deskripsi: deskripsi,
          foto: foto,
          social: social,
          bahan: bahan,
          langkah: langkah);

  Future<bool> deleteResep(int id) => _resepServices.deleteResep(id);

  Future<bool?> addHistory(int id) async {
    String? resepString = PreferenceService.instance.getString("resep");
    if (resepString != null) {
      List<dynamic> listResepId = json.decode(resepString);
      listResepId.remove(id);
      listResepId.insert(0, id);
      return await PreferenceService.instance
          .setString("resep", json.encode(listResepId));
    } else {
      return await PreferenceService.instance
          .setString("resep", json.encode([id]));
    }
  }

  Future<List<Resep>?> getHistory() async {
    String? resepString = PreferenceService.instance.getString("resep");
    if (resepString != null) {
      List<dynamic> listResepId = json.decode(resepString);
      List<Resep> resep = [];
      for (var element in listResepId) {
        resep.add(Get.find<ResepController>()
            .current
            .where((e) => e.id == element)
            .first);
      }
      return resep;
    }
    return null;
  }
}
