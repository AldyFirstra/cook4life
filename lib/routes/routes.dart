part of 'pages.dart';

class AppRoutes {
  static const INITIAL = AppPages.LoginPage;

  static final pages = [
    GetPage(name: _Paths.LoginPage, page: () => LoginPage()),
    GetPage(
      name: _Paths.Navigator,
      page: () => BottomNav(),
      bindings: [
        NavigatorBinding(),
        HomeBinding(),
        CategoryBinding(),
        TambahResepBinding(),
        NotifikasiBinding(),
        ProfileBinding(),
      ],
      transition: Transition.downToUp,
    ),
    GetPage(name: _Paths.DetailResep, page: () => DetailResepPage()),
    GetPage(name: _Paths.DetailResep2, page: () => DetailResep2Page()),
    GetPage(name: _Paths.CategoryHasil, page: () => CategoryHasilPage()),
    GetPage(name: _Paths.DetailMasakan, page: () => DetailMasakanPage()),
    GetPage(name: _Paths.Introduction, page: () => Introduction()),
  ];
}
