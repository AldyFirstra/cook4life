import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir/routes/pages.dart';
import 'package:tugas_akhir/services/service_preferences.dart';

class Introduction extends StatelessWidget {
  const Introduction({ Key? key }) : super(key: key);

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
              image: Center(
                  // child: ,
                  ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(color: Colors.orange),
                bodyTextStyle: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
            PageViewModel(
              title: "Title of Second page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: Center(
                  // child: ,
                  ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(color: Colors.orange),
                bodyTextStyle: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
            PageViewModel(
              title: "Title of Third page",
              body:
                  "Here you can write the description of the page, to explain someting...",
              image: Center(
                  // child: ,
                  ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(color: Colors.orange),
                bodyTextStyle: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ),
          ],
          onDone: () {
            PreferenceService.setFirst("untrue");
            Get.offAllNamed(AppPages.LoginPage);
          },
          showBackButton: false,
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          next: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.amber[700]),
            child: Center(
              child: Text(
                "Next",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          done: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.amber[700]),
            child: Center(
              child: Text(
                "Done",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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