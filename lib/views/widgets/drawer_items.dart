import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/Utils/routes.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';
import 'package:pap/views/widgets/drawer_list_item.dart';

class DrawerItems extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: ClipOval(
                        child: Image.asset(
                          "images/default-user.png",
                          color: primaryColor.withOpacity(0.4),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => Text(
                        authController.currentUser.value.name!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Filho",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const DrawerListItem(title: "Página Inicial", icon: Icons.home),
              DrawerListItem(
                  title: "Meu perfil",
                  icon: Icons.person,
                  action: () async {
                    Routes.navigateTo(
                        context, RouteGenerator.profilePage, true);
                  }),
              DrawerListItem(
                  title: "Familiares",
                  icon: Icons.people_alt,
                  action: () async {
                    Routes.navigateTo(
                        context, RouteGenerator.listRelative, true);
                  }),
              const DrawerListItem(title: "Ajuda", icon: Icons.help),
              DrawerListItem(
                  title: "Definições",
                  icon: Icons.settings,
                  action: () async {
                    Routes.navigateTo(
                        context, RouteGenerator.settingsPage, true);
                  }),
            ],
          ),
        ),
        DrawerListItem(
            title: "Terminar sessão",
            icon: Icons.logout,
            action: () async {
              authController.isLoading.value = true;
              await authController.logout();
            }),
      ],
    );
  }
}
