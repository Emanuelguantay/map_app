import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = HashSet<Marker>();
  late GoogleMapController _mapController;
  late BitmapDescriptor _markerIcon;

  void _setMarkerIcon() async{
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), assetName)
  }

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(-24.7859, -65.41166),
          infoWindow: InfoWindow(
            title: "Salta",
            snippet: "Salta-Capital"
          )
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Map"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              _googleMap(),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 20),
                child: Text("Ciudad"),
              )
            ],
          )
    
          
        ),
      ),
    );
  }

  _googleMap(){
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(-24.7859, -65.41166),
        zoom: 15
      ),
      markers: _markers,
      );
  }
}