import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:SMSI/Utils/update_data.dart';
import 'package:SMSI/constants/color.dart';
import 'package:SMSI/constants/constants.dart';
import 'package:SMSI/controllers/auth_controller.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController mapController;
  final authController = Get.find<AuthController>();
  final dataUpdater = UpdateData();

  static const sourceLocation = LatLng(37.33500926, -122.03272188);
  static const destinationLocation = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  String googleAPiKey = API_KEY;

  @override
  void initState() {
    super.initState();
    dataUpdater.startUpdatingData();
  }

  @override
  void dispose() {
    super.dispose();
    dataUpdater.stopUpdating();
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
      body: Obx(() => GoogleMap(
            onMapCreated: _onMapCreated,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(
                    authController.currentUser.value.bracelet!.latitude! ?? 0,
                    authController.currentUser.value.bracelet!.longitude! ?? 0),
                zoom: 14.5),
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
                position: LatLng(
                    authController.currentUser.value.bracelet!.latitude! ?? 0,
                    authController.currentUser.value.bracelet!.longitude! ?? 0),
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
          )),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }
}
