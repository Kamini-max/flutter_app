import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/loaction.dart';

class MapViewScreen extends StatefulWidget {
  //const MapViewScreen({super.key});
  //final double? lat;
 // final double? lng;
  final Location location;

  MapViewScreen({required this.location});



  @override
  State<MapViewScreen> createState() => MapViewScreenState();
}

class MapViewScreenState extends State<MapViewScreen>{
  final Completer<GoogleMapController> _completer = Completer();
 //
  @override
  Widget build(BuildContext context) {
    CameraPosition target = CameraPosition(target: LatLng(widget.location.lat!,widget.location.lng!), bearing: 100, zoom: 15);
   return Scaffold(
     appBar: AppBar(title: const Text('Tcs Map View'), centerTitle: true,),
     body: GoogleMap(
         initialCameraPosition: target,
         mapType: MapType.normal,
         markers: {
           Marker(
             markerId: const MarkerId("Tcs Demo"),
             position: LatLng(widget.location.lat!,widget.location.lng!),
           ),
         },
         onMapCreated: (GoogleMapController controller){
       _completer.complete(controller);
     })

   );


  }

}




