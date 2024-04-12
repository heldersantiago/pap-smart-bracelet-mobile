import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/routes.dart';

class ProfileEditScreen extends StatefulWidget {
  ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _nameController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    _emailController.text = authController.currentUser.value.email!;
    _phoneController.text = authController.currentUser.value.phone!;
    _nameController.text = authController.currentUser.value.name!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.profilePage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: primaryColor,
          title: const Text(
            "Editar perfil",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150',
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Nome",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Telefone",
                ),
              ),
              const Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
