import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';
import 'package:pap/views/widgets/list_tile_settings.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              color: backgroundColor,
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.homePage);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            backgroundColor: primaryColor,
            title: const Text(
              "Definições",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("images/doctors.png"),
                    ),
                    title: Text(
                      authController.currentUser.value.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    subtitle: const Text(
                      "Filho",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    )),
                const Divider(height: 15),
                const SizedBox(height: 20),
                ListTileSettings(
                  icon: CupertinoIcons.person,
                  title: "Perfil",
                  colorShape: const Color.fromARGB(255, 187, 222, 251),
                  colorIcon: Colors.blue,
                  route: RouteGenerator.profilePage,
                  useEffect: true,
                ),
                const SizedBox(height: 20),
                ListTileSettings(
                  icon: Icons.broadcast_on_home_outlined,
                  title: "Dispositivo",
                  colorShape: const Color.fromARGB(255, 200, 230, 201),
                  colorIcon: Colors.green,
                  route: RouteGenerator.devicePage,
                  useEffect: false,
                ),
                const SizedBox(height: 20),
                ListTileSettings(
                  icon: Icons.policy,
                  title: "Termos e Políticas",
                  colorShape: const Color.fromARGB(255, 225, 190, 231),
                  colorIcon: Colors.purple,
                  route: RouteGenerator.settingsPage,
                  useEffect: false,
                ),
                const SizedBox(height: 10),
                const Divider(height: 15),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () async {
                    authController.isLoading.value = true;
                    await authController.logout();
                  },
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 205, 210),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                  title: const Text(
                    "Terminar sessão",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                Obx(() => authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox(height: 1)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
