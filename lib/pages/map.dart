import 'dart:async';

import 'package:bus_app/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const LatLng sourceLocation = LatLng(10.7843064, 106.6412747);
  //static const LatLng destinationLocation = LatLng(10.7775587, 106.6272397);
  static const LatLng _center = LatLng(10.7746392, 106.622519);
  static const LatLng _center1 = LatLng(10.7748402, 106.6128725);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDbGeI83kR8VVgfogDsWeOz0lYVyVwU2DY',
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(_center1.latitude, _center1.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) => {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
          });
      setState(() {});
    }
  }

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId("source"),
      position: sourceLocation,
      infoWindow: InfoWindow(title: 'Source'),
    ),
    // const Marker(
    //   markerId: MarkerId("destination"),
    //   position: destinationLocation,
    //   infoWindow: InfoWindow(title: 'Destination'),// hien thi ten khi click vao marker
    // ),
    // const Marker(
    //   markerId: MarkerId("center"),
    //   position: _center,
    //   infoWindow: InfoWindow(title: 'Center'),
    // ),
    const Marker(
      markerId: MarkerId("center1"),
      position: _center1,
      infoWindow: InfoWindow(title: 'Center1'),
    ),
  };
  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: sourceLocation,
        zoom: 14,
      ),
      markers: _markers,
      polylines: {
        Polyline(
          polylineId: PolylineId("polyline"),
          points: polylineCoordinates,
        ),
      },
    ));
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
