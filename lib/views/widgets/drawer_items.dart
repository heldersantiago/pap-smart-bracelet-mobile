import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/views/widgets/drawer_list_item.dart';

class DrawerItems extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

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
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
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
                    Text(
                      authController.currentUser.value.email!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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
              const DrawerListItem(title: "Ajuda", icon: Icons.help),
              const DrawerListItem(title: "Definições", icon: Icons.settings),
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
