import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tambah_toko_controller.dart';

class TambahTokoView extends GetView<TambahTokoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.amber),
        title: Text(
          "Tambah Toko",
          style: GoogleFonts.poppins(
              color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(
            bottom: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: Offset(1.0, 2.0),
              ),
            ],
          ),
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Nama Bahan masakan tidak boleh kosong";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama Toko",
                  label: Text(
                    "Nama Toko",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                autocorrect: false,
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Harga bahan masakan tidak boleh kosong";
                  }
                  return null;
                },
                maxLines: 3,
                decoration: InputDecoration(
                  label: Text(
                    "Alamat Toko",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                autocorrect: false,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Tempat beli bahan masakan tidak boleh kosong";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.location_on)),
                  label: Text(
                    "Maps Toko",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                autocorrect: false,
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Tempat beli bahan masakan tidak boleh kosong";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(
                    "Nomer Telepon",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
