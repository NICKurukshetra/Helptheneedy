import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map1 extends StatefulWidget {
  @override
  _Map1State createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  var lat, lng;
  @override
  Widget build(BuildContext context) {
    location() async {
      var p = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      print(p);
    }

    var cp =
        CameraPosition(target: LatLng(26.86666, 75.2333), zoom: 0, tilt: 50);
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: location,
          child: Icon(Icons.location_on),
        ),
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: GoogleMap(initialCameraPosition: cp),
      ),
    );
  }
}
