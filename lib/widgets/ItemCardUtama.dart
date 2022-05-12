import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCardUtama extends StatelessWidget {
  ItemCardUtama(this.nama, this.foto);

  final String nama;
  final String foto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsetsDirectional.only(end: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 2.0),
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 300,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: NetworkImage(foto), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            nama,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 12,
              ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 20,
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
    );
  }
}
