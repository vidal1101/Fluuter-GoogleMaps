
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Completer<GoogleMapController> _controller = Completer();

  MapType maptype = MapType.normal;


  final CameraPosition puntoIncial = CameraPosition(
    target: LatLng(10.628142, -85.432920),
    zoom: 17,
    tilt: 50, 
    bearing: 50, 
  );

  @override
  Widget build(BuildContext context) {

    Set<Marker> markers = Set<Marker>();

    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: LatLng(10.628142, -85.432920),
    ));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mapa'),
          actions: [
            IconButton(onPressed: (){
              if(maptype == MapType.normal) maptype = MapType.satellite;
              else maptype = MapType.normal;
              setState(() {});
            }, 
            icon: Icon(Icons.map_outlined))
          ],
        ),
        body: GoogleMap(
          markers: markers,
          mapType: maptype,
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
       ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(puntoIncial));
  }
  
}