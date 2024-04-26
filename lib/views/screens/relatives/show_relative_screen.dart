import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';

class ShowRelativeScreen extends StatefulWidget {
  final int id;

  ShowRelativeScreen({super.key, required this.id});

  @override
  State<ShowRelativeScreen> createState() => _ShowRelativeScreenState();
}

class _ShowRelativeScreenState extends State<ShowRelativeScreen> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            color: backgroundColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteGenerator.homePage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: primaryColor,
          title: Text(
            "Informação de perfil " + widget.id.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              Text(
                authController.currentUser.value.name!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Filho',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoItem(Icons.email,
                  authController.currentUser.value.email!, "Email"),
              _buildInfoItem(Icons.phone,
                  authController.currentUser.value.phone!, "Telefone"),
              _buildInfoItem(Icons.location_on, 'New York, USA', "Morada"),
              const SizedBox(height: 20),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(1),
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteGenerator.profileEditPage);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Obx(() => authController.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Editar perfil",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              blurStyle: BlurStyle.outer,
              spreadRadius: 2,
              blurRadius: 2)
        ], borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
