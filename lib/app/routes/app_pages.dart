import 'package:get/get.dart';

import '../modules/category-hasil/bindings/category_hasil_binding.dart';
import '../modules/category-hasil/views/category_hasil_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/detail-masakan/bindings/detail_masakan_binding.dart';
import '../modules/detail-masakan/views/detail_masakan_view.dart';
import '../modules/detail-resep/bindings/detail_resep_binding.dart';
import '../modules/detail-resep/views/detail_resep_view.dart';
import '../modules/detail-resep2/bindings/detail_resep2_binding.dart';
import '../modules/detail-resep2/views/detail_resep2_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_navbar/bindings/home_navbar_binding.dart';
import '../modules/home_navbar/views/home_navbar_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/list_toko/bindings/list_toko_binding.dart';
import '../modules/list_toko/views/list_toko_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/tambah-resep/bindings/tambah_resep_binding.dart';
import '../modules/tambah-resep/views/tambah_resep_view.dart';
import '../modules/tambah_toko/bindings/tambah_toko_binding.dart';
import '../modules/tambah_toko/views/tambah_toko_view.dart';
import '../modules/toko_maps/bindings/toko_maps_binding.dart';
import '../modules/toko_maps/views/toko_maps_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const INTRODUCTION = Routes.INTRODUCTION;
  static const HOME = Routes.HOME_NAVBAR;

  static final routes = [
    GetPage(
        name: _Paths.HOME_NAVBAR,
        page: () => const HomeNavbarView(),
        bindings: [
          HomeNavbarBinding(),
          HomeBinding(),
          ProfileBinding(),
          CategoryBinding(),
          TambahResepBinding(),
          NotifikasiBinding()
        ],
        children: [
          GetPage(
            name: _Paths.HOME,
            page: () => const HomeView(),
          ),
          GetPage(
            name: _Paths.PROFILE,
            page: () => const ProfileView(),
          ),
          GetPage(
            name: _Paths.CATEGORY,
            page: () => const CategoryView(),
          ),
          GetPage(
            name: _Paths.TAMBAH_RESEP,
            page: () => const TambahResepView(),
          ),
        ]),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RESEP,
      page: () => const DetailResepView(),
      binding: DetailResepBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RESEP2,
      page: () => const DetailResep2View(),
      binding: DetailResep2Binding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_HASIL,
      page: () => const CategoryHasilView(),
      binding: CategoryHasilBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MASAKAN,
      page: () =>  DetailMasakanView(),
      binding: DetailMasakanBinding(),
    ),
    GetPage(
      name: _Paths.LIST_TOKO,
      page: () => const ListTokoView(),
      binding: ListTokoBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_TOKO,
      page: () => const TambahTokoView(),
      binding: TambahTokoBinding(),
    ),
    GetPage(
      name: _Paths.TOKO_MAPS,
      page: () => const TokoMapsView(),
      binding: TokoMapsBinding(),
    ),
  ];
}
