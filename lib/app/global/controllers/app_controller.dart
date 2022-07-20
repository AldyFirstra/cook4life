import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/models/user.dart';
import 'package:uni_links/uni_links.dart';

import '../../data/models/resep.dart';
import '../../data/repository/resep_repository.dart';
import '../../data/utils/service_preferences.dart';
import '../../routes/app_pages.dart';

class AppController extends GetxController {
  User? user;

  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;

  StreamSubscription? _sub;

  final _scaffoldKey = GlobalKey();
  late final _cmds;
  final _cmdStyle = const TextStyle(
      fontFamily: 'Courier', fontSize: 12.0, fontWeight: FontWeight.w700);
  @override
  void onInit() {
    _handleIncomingLinks();
    _cmds = getCmds();
    super.onInit();
  }

  List<String>? getCmds() {
    late final String cmd;
    var cmdSuffix = '';

    const plainPath = 'path/subpath';
    const args = 'path/portion/?uid=123&token=abc';
    const emojiArgs =
        '?arr%5b%5d=123&arr%5b%5d=abc&addr=1%20Nowhere%20Rd&addr=Rand%20City%F0%9F%98%82';

    if (kIsWeb) {
      return [
        plainPath,
        args,
        emojiArgs,
        // Cannot create malformed url, since the browser will ensure it is valid
      ];
    }

    if (Platform.isIOS) {
      cmd = '/usr/bin/xcrun simctl openurl booted';
    } else if (Platform.isAndroid) {
      cmd = '\$ANDROID_HOME/platform-tools/adb shell \'am start'
          ' -a android.intent.action.VIEW'
          ' -c android.intent.category.BROWSABLE -d';
      cmdSuffix = "'";
    } else {
      return null;
    }

    // https://orchid-forgery.glitch.me/mobile/redirect/
    return [
      '$cmd "unilinks://host/$plainPath"$cmdSuffix',
      '$cmd "unilinks://example.com/$args"$cmdSuffix',
      '$cmd "unilinks://example.com/$emojiArgs"$cmdSuffix',
      '$cmd "unilinks://@@malformed.invalid.url/path?"$cmdSuffix',
    ];
  }

  /// Handle incoming links - the ones that the app will recieve from the OS
  /// while already started.
  void _handleIncomingLinks() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _sub = uriLinkStream.listen((Uri? uri) async {
        print('got uri: $uri');
        var user = PreferenceService.instance.getString('user');
        if (user != null) {
          String id = uri.toString().split('/').last;
          Resep resep = (await ResepRepository.instance
              .getDetailResep(int.tryParse(id) ?? 4))!;
          Get.toNamed(Routes.DETAIL_MASAKAN, arguments: resep);
        }
      }, onError: (Object err) {
        print('got err: $err');
      });
    }
  }

  @override
  void onClose() {
    _sub?.cancel();
    super.onClose();
  }

  void privacyPolicy() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Center(
                  child: Text(
                "Pemberitahuan",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Center(
                    child: Text(
                      '''
Aplikasi Cook4life mengumpulkan
data lokasi untuk mendapatkan
lokasi akurat dari pengguna untuk
menambahkan lokasi pembelian
bahan yang diisi oleh pengguna
                            ''',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Center(
                      child: Text(
                        "Okay",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
