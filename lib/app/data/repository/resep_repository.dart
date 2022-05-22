import 'dart:io';

import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/api/services/resep_services.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

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
          langkah: langkah);

  Future<List<Resep>?> getListRekomendasi() =>
      _resepServices.getListRekomendasi();

  Future<List<Resep>?> getListResepByQuery(
          {required Map<String, String> query}) =>
      _resepServices.getListResepByQuery(query: query);
}
