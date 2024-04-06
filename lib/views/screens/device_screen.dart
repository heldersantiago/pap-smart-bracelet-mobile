import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/controllers/bracelet_controller.dart';
import 'package:pap/routes.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final BraceletController braceletController = BraceletController();
    final formkey = GlobalKey<FormState>();
    final TextEditingController deviceNumberController =
        TextEditingController();
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
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sem pulseira associada"),
                Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        FloatingActionButton(
                          backgroundColor: Colors.purple.withOpacity(.8),
                          onPressed: () {
                            Get.dialog(
                              AlertDialog(
                                title: const Text("Adicionar Pulseira"),
                                // Dialog title
                                content: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        controller: deviceNumberController,
                                        maxLength: 6,
                                        decoration: const InputDecoration(
                                          hintText:
                                              "Digite o número da pulseira",
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Erro";
                                          }
                                          if (value.length < 6) {
                                            return "ID da pulseira deve ter 6 caracteres";
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () async {
                                          // Add device button action

                                          await braceletController.create(
                                              deviceNumberController.text);
                                        },
                                        child: const Text("Adicionar Pulseira"),
                                      ),
                                    ],
                                  ),
                                ),
                                // Placeholder content
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back(); // Close the dialog
                                    },
                                    child: const Text(
                                        "Fechar"), // Close button text
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
