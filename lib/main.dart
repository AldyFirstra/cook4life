import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/routes/pages.dart';
import 'package:tugas_akhir/services/service_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cook4Life",
      getPages: AppRoutes.pages,
      // initialRoute: AppPages.Introduction,
      initialRoute: PreferenceService.getFirst() != "untrue"
          ? AppPages.Introduction
          : AppRoutes.INITIAL,
      defaultTransition: Transition.fadeIn,
    );
  }
}
