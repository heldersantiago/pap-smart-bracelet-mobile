import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/Utils/routes.dart';
import 'package:pap/controllers/auth_controller.dart';

class ListTileSettings extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color colorIcon;
  final Color colorShape;
  final String route;
  final bool useEffect;
  final AuthController authController = Get.find<AuthController>();

  ListTileSettings({
    required this.icon,
    required this.title,
    required this.colorShape,
    required this.colorIcon,
    required this.route,
    required this.useEffect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ]),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: ListTile(
          onTap: () async {
            // Get.to(RouteGenerator.generateRoute(RouteSettings(name: screen),useEffect: false));
            Routes.navigateTo(context, route, useEffect);
          },
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration:
                BoxDecoration(color: colorShape, shape: BoxShape.circle),
            child: Icon(
              icon,
              color: colorIcon,
              size: 35,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
