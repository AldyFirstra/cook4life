import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas_akhir/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/app/global/bindings/app_binding.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';
import 'package:tugas_akhir/app/data/utils/service_preferences.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

import 'app/data/utils/service_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cook4Life",
      getPages: AppPages.routes,
      // initialRoute: AppPages.Introduction,
      initialRoute: getInitialRoute(),
      defaultTransition: Transition.fadeIn,
      initialBinding: AppBinding(),
    );
  }

  String getInitialRoute() {
    var user = PreferenceService.instance.getString('user');
    if (user != null) {
      Get.put<AppController>(
        AppController(),
      ).user = User.fromMap(json.decode(user));
      return AppPages.HOME;
    } else {
      return AppPages.INITIAL;
    }
  }
}
