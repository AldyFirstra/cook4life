import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tugas_akhir/app/modules/category/views/category_view.dart';
import 'package:tugas_akhir/app/modules/home/views/home_view.dart';
import 'package:tugas_akhir/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:tugas_akhir/app/modules/profile/views/profile_view.dart';
import 'package:tugas_akhir/app/modules/tambah-resep/views/tambah_resep_view.dart';

import '../controllers/home_navbar_controller.dart';

class HomeNavbarView extends GetView<HomeNavbarController> {
  const HomeNavbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedView,
            children: const [
              HomeView(),
              CategoryView(),
              TambahResepView(),
              NotifikasiView(),
              ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 5,
            enableFeedback: false,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: controller.selectedView,
            onTap: (value) => controller.changeSelectedView(value),
            items: [
              itemBottom("home", "assets/icons/home.svg"),
              itemBottom("category", "assets/icons/category.svg"),
              itemBottom("tambah", "assets/icons/tambah.svg"),
              itemBottom("notifikasi", "assets/icons/notifikasi.svg"),
              itemBottom("profile", "assets/icons/profile.svg"),
            ],
          ),
        ),
      ),
    );
  }

  itemBottom(String label, String icon) {
    return BottomNavigationBarItem(
      activeIcon: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          width: 50,
          color: Colors.amber.withOpacity(0.3),
          child: Center(
            child: SvgPicture.asset(
              icon,
              color: Colors.amber,
            ),
          ),
        ),
      ),
      label: "",
      icon: SvgPicture.asset(
        icon,
        color: Colors.black,
      ),
    );
  }
}
