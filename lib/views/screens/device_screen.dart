import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final Map<String, IconData> dvInfo = {
      "Dispositivo": Icons.devices,
      "Estado": Icons.health_and_safety_outlined,
      "Associado desde": Icons.date_range,
    };
    List<String> descriptions = ["2398282", "Estado normal", "12/03/32"];

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteGenerator.homePage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: primaryColor,
          title: const Text(
            "Dispositivo",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: authController.currentUser.value.bracelet != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset("images/Wristwatch-rafiki.png"),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          String name = dvInfo.keys.elementAt(index);
                          IconData icon = dvInfo.values.elementAt(index);
                          String description = descriptions[index];
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 4,
                                        blurStyle: BlurStyle.outer,
                                        color: Colors.black26)
                                  ]),
                              child: ListTile(
                                leading: Icon(icon),
                                trailing: Text(index == 0 ? "8 sensores" : "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                                title: Text(
                                  name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(index == 0
                                    ? authController
                                        .currentUser.value.bracelet!.deviceId!
                                    : description),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text("Sem pulseira associada"),
            ),
    );
  }
}
