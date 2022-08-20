
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    final CameraPosition puntoIncial = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
    );

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: puntoIncial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
   );
  }
}