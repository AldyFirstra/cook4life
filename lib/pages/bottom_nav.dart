import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/controllers/homeC.dart';
import 'package:tugas_akhir/controllers/navigatorC.dart';
import 'package:tugas_akhir/pages/category.dart';
import 'package:tugas_akhir/pages/home.dart';
import 'package:tugas_akhir/pages/notifikasi.dart';
import 'package:tugas_akhir/pages/profile.dart';
import 'package:tugas_akhir/pages/tambahResep.dart';

class BottomNav extends StatelessWidget {
  NavigatorController navC = Get.find();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      child: GetBuilder<NavigatorController>(
        builder: (controller) => Scaffold(
          body: Obx(
            () => IndexedStack(
              index: navC.selectedView.value,
              children: [
                HomePage(),
                CategoryPage(),
                TambahResepPage(),
                NotifikasiPage(),
                ProfilePage(),
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
              currentIndex: navC.selectedView.value,
              onTap: (value) {
                navC.selectedView.value = value;
              },
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
