import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScreenHomeMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenHomeMapState();
  }
}

class ScreenHomeMapState extends State<ScreenHomeMap> {
  late GoogleMapController _controller;

  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(13.910539, 109.0712495));

  final List<Marker> markers = [];

  addMarker(cordinate) {
    int id = Random().nextInt(100);

    setState(() {
      markers
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Google Map",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate) {
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),
    );
  }
}
