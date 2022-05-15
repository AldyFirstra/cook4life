import 'package:tugas_akhir/app/data/api/services/resep_services.dart';
import 'package:tugas_akhir/app/data/models/kategori.dart';

import '../models/resep.dart';

class ResepRepository {
  ResepRepository._();
  static final ResepRepository _instance = ResepRepository._();
  static ResepRepository get instance => _instance;
  final _resepServices = ResepServices.instance;

  Future<List<Resep>?> getListResep() => _resepServices.getListResep();

  Future<List<Kategori>?> getListKategori() => _resepServices.getListKategori();
}
