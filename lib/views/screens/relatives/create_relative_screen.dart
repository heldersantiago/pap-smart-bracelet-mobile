import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';

class CreateRelativeScreen extends StatefulWidget {
  const CreateRelativeScreen({super.key});

  @override
  State<CreateRelativeScreen> createState() => _CreateRelativeScreenState();
}

class _CreateRelativeScreenState extends State<CreateRelativeScreen> {
  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            color: backgroundColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteGenerator.homePage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: primaryColor,
          title: const Text(
            "Adicionar um familiar",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Nome",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Telefone",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: button(),
          )
        ],
      ),
    );
  }

  Widget button() {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: primaryColor,
        borderRadius: BorderRadius.circular(1),
        child: InkWell(
          onTap: () async {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Obx(() => authController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      "Salvar",
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
    );
  }
}
