import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom {
  static void loading() {
    showDialog(
        context: Get.context!,
        builder: (context) => SizedBox(
              height: Get.height,
              width: Get.width,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ));
  }
}
