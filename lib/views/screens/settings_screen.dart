import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';
import 'package:pap/views/widgets/list_tile_settings.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Definições",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/doctors.png"),
                ),
                title: Text(
                  authController.currentUser.value.email!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                subtitle: const Text(
                  "Filho",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                )),
            const Divider(height: 15),
            const SizedBox(height: 20),
            ListTileSettings(
              icon: CupertinoIcons.person,
              title: "Perfil",
              colorShape: const Color.fromARGB(255, 187, 222, 251),
              colorIcon: Colors.blue,
              screen: RouteGenerator.profilePage,
            ),
            const SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.notifications_none_outlined,
              title: "Notificações",
              colorShape: const Color.fromARGB(255, 197, 202, 233),
              colorIcon: Colors.indigo,
              screen: RouteGenerator.notificationPage,
            ),
            const SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.broadcast_on_home_outlined,
              title: "Dispositivo",
              colorShape: const Color.fromARGB(255, 200, 230, 201),
              colorIcon: Colors.green,
              screen: RouteGenerator.devicePage,
            ),
            const SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.info_outline_rounded,
              title: "Sobre Nós",
              colorShape: const Color.fromARGB(255, 255, 224, 178),
              colorIcon: Colors.orange,
              screen: RouteGenerator.profilePage,
            ),
            const SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.policy,
              title: "Termos e Políticas",
              colorShape: const Color.fromARGB(255, 225, 190, 231),
              colorIcon: Colors.purple,
              screen: RouteGenerator.settingsPage,
            ),
            const SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.help_outline_rounded,
              title: "Central de Ajuda",
              colorShape: const Color.fromARGB(255, 255, 236, 179),
              colorIcon: Colors.amber,
              screen: RouteGenerator.notificationPage,
            ),
            const SizedBox(height: 10),
            const Divider(height: 15),
            const SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.logout,
              title: "Terminar sessão",
              colorShape: const Color.fromARGB(255, 255, 205, 210),
              colorIcon: Colors.red,
              screen: RouteGenerator.loginPage,
              toLogout: true,
            ),
            const SizedBox(height: 20),
            GetBuilder<AuthController>(builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const SizedBox.shrink();
              }
            })
          ],
        ),
      ),
    );
  }
}
