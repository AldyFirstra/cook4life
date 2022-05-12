import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: DefaultTabController(
      //   length: 2,
      //   child: SafeArea(child: NestedScrollView(
      //     physics: BouncingScrollPhysics(),
      //     headerSliverBuilder: (context, innerBoxIsScrolled) => SliverAppBar(
      //       actions: [Padding(padding: EdgeInsets.all(15)),],
      //       title: Text("Profil", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
      //       backgroundColor: Colors.white,
      //       pinned: true,
      //       elevation: 1,
      //       forceElevated: true,
      //       primary: true,
      //       expandedHeight: 300,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: ,
      //       ),
      //     ),
      //   )),
      // ),
    );
  }
}