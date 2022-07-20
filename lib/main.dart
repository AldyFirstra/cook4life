import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:tugas_akhir/app/data/models/resep.dart';
import 'package:tugas_akhir/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/app/data/repository/resep_repository.dart';
import 'package:tugas_akhir/app/global/bindings/app_binding.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';
import 'package:tugas_akhir/app/data/utils/service_preferences.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

import 'app/data/utils/service_preferences.dart';

import 'package:uni_links/uni_links.dart';

bool _initialUriIsHandled = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
