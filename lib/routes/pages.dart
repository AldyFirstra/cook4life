import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/bindings/categoryB.dart';
import 'package:tugas_akhir/bindings/homeB.dart';
import 'package:tugas_akhir/bindings/navigatorB.dart';
import 'package:tugas_akhir/bindings/notifikasiB.dart';
import 'package:tugas_akhir/bindings/profileB.dart';
import 'package:tugas_akhir/bindings/tambahResepB.dart';
import 'package:tugas_akhir/pages/Introduction.dart';
import 'package:tugas_akhir/pages/bottom_nav.dart';
import 'package:tugas_akhir/pages/category_hasil.dart';
import 'package:tugas_akhir/pages/detail_masakan.dart';
import 'package:tugas_akhir/pages/detail_resep.dart';
import 'package:tugas_akhir/pages/detail_resep2.dart';
import 'package:tugas_akhir/pages/home.dart';
import 'package:tugas_akhir/pages/login.dart';

part 'routes.dart';

class AppPages{
  static const Introduction = _Paths.Introduction;
  static const LoginPage = _Paths.LoginPage;
  static const HomePage = _Paths.HomePage;
  static const Navigator = _Paths.Navigator;
  static const Category = _Paths.Category;
  static const Profile = _Paths.Profile;
  static const Notifikasi = _Paths.Notifikasi;
  static const TambahResep = _Paths.TambahResep;
  static const DetailResep = _Paths.DetailResep;
  static const DetailResep2 = _Paths.DetailResep2;
  static const CategoryHasil = _Paths.CategoryHasil;
  static const DetailMasakan = _Paths.DetailMasakan;
}

abstract class _Paths{
  static const Introduction = '/introduction';
  static const LoginPage = '/login';
  static const HomePage = '/home';
  static const Navigator = '/';
  static const Category = '/category';
  static const Profile = '/profile';
  static const Notifikasi = '/notifikasi';
  static const TambahResep = '/tambah-resep';
  static const DetailResep = '/detail-resep';
  static const DetailResep2 = '/detail-resep2';
  static const CategoryHasil = '/category-hasil';
  static const DetailMasakan = '/detail-masakan';
}