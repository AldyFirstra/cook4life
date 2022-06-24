import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:tugas_akhir/app/data/repository/auth_repository.dart';
import 'package:tugas_akhir/app/global/controllers/app_controller.dart';

class HomeNavbarController extends GetxController {
  final _selectedView = 0.obs;
  int get selectedView => _selectedView.value;

  void changeSelectedView(int val) => _selectedView.value = val;

  final AppController app = Get.find();

  FirebaseMessaging fcm = FirebaseMessaging.instance;
  StreamSubscription<String>? onChangeFCMTokenListener;
  StreamSubscription<RemoteMessage>? onMessage;

  @override
  void onInit() {
    fcm.getToken().then((value) {
      if (value != null) {
        AuthRepository.instance.saveFCM(value);
      }
    });
    requestFCMPermission().then((_) {
      fcm.getToken().then((value) {
        if (value != null) {
          AuthRepository.instance.saveFCM(value);
        }
      });
    });
    onChangeFCMTokenListener =
        fcm.onTokenRefresh.listen(AuthRepository.instance.saveFCM);
    onMessage = FirebaseMessaging.onMessage.listen((event) async {
      Get.snackbar(event.notification!.title!, event.notification!.body!);
    });
    super.onInit();
  }

  Future<void> requestFCMPermission() async {
    NotificationSettings current = await fcm.getNotificationSettings();
    if (current.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (current.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
      NotificationSettings settings = await fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

  @override
  void onClose() {
    onChangeFCMTokenListener!.cancel();
    onMessage!.cancel();
    super.onClose();
  }
}
