
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Completer<GoogleMapController> _controller = Completer();

   final CameraPosition puntoIncial = CameraPosition(
    target: LatLng(10.628142, -85.432920),
    zoom: 17,
    );

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: puntoIncial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Punto inicial'),
        icon: Icon(Icons.directions_boat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
   );
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(puntoIncial));
  }
}