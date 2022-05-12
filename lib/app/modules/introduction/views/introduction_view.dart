import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tugas_akhir/app/data/utils/service_preferences.dart';
import 'package:tugas_akhir/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Title of First page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: const Center(
                  // child: ,
                  ),
              decoration: PageDecoration(
                titleTextStyle: const TextStyle(color: Colors.orange),
                bodyTextStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
            PageViewModel(
              title: "Title of Second page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: const Center(
                  // child: ,
                  ),
              decoration: PageDecoration(
                titleTextStyle: const TextStyle(color: Colors.orange),
                bodyTextStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
            PageViewModel(
              title: "Title of Third page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: const Center(
                  // child: ,
                  ),
              decoration: PageDecoration(
                titleTextStyle: const TextStyle(color: Colors.orange),
                bodyTextStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
          ],
          onDone: () {
            PreferenceService.setFirst("untrue");
            Get.offAllNamed(Routes.LOGIN);
          },
          showBackButton: false,
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          next: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber[700]),
            child: Center(
              child: Text(
                "Next",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          done: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber[700]),
            child: Center(
              child: Text(
                "Done",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Colors.amber[700],
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
