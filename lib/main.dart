import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/app/global/bindings/app_binding.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

import 'app/data/utils/service_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();

  await SharedPreferences.getInstance();
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
      initialRoute: PreferenceService.getFirst() != "untrue"
          ? AppPages.INTRODUCTION
          : AppPages.INITIAL,
      defaultTransition: Transition.fadeIn,
      initialBinding: AppBinding(),
    );
  }
}
