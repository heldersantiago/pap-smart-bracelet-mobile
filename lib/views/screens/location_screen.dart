import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/constants/constants.dart';
import 'package:pap/controllers/auth_controller.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController mapController;
  final authController = Get.find<AuthController>();

  static const sourceLocation = LatLng(37.33500926, -122.03272188);
  static const destinationLocation = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  String googleAPiKey = API_KEY;

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
            googleAPiKey,
            PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
            PointLatLng(
                destinationLocation.latitude, destinationLocation.longitude));
    if (polylineResult.points.isNotEmpty) {
      for (var point in polylineResult.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Text(""),
        title: const Text(
          "Localização",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        initialCameraPosition:
            const CameraPosition(target: sourceLocation, zoom: 12.5),
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        rotateGesturesEnabled: true,
        polylines: {
          Polyline(
              polylineId: const PolylineId("route"),
              points: polylineCoordinates,
              color: primaryColor)
        },
        markers: {
          Marker(
            markerId: const MarkerId('source'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet),
            position: sourceLocation,
            infoWindow: InfoWindow(
                title: authController.currentUser.value.name,
                snippet: "Minha localização actual"),
          ),
          Marker(
            markerId: const MarkerId('destination'),
            infoWindow: InfoWindow(
                title: authController.currentUser.value.name,
                snippet: "Última localização há 10min"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueMagenta),
            position: destinationLocation,
          ),
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }
}
