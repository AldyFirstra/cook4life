import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/toko_maps_controller.dart';

class TokoMapsView extends GetView<TokoMapsController> {
  const TokoMapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: controller.centerLocation);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.amber),
          title: Text(
            "Pilih Lokasi Toko",
            style: GoogleFonts.poppins(
                color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            Obx(
              () => controller.centerLocation != null
                  ? FlutterMap(
                      options: MapOptions(
                          center: controller.centerLocation,
                          zoom: 15,
                          onTap: (tap, location) {
                            controller.changeLocation(
                                LatLng(location.latitude, location.longitude));
                          }),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                          attributionBuilder: (_) {
                            return const Text("© OpenStreetMap contributors");
                          },
                        ),
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: controller.centerLocation ??
                                  LatLng(51.5, -0.09),
                              builder: (ctx) => const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
