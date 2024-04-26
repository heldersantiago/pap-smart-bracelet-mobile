import 'package:flutter/material.dart';
import 'package:pap/constants/color.dart';

import '../../../routes.dart';

class EditRelativeScreen extends StatefulWidget {
  const EditRelativeScreen({super.key});

  @override
  State<EditRelativeScreen> createState() => _EditRelativeScreenState();
}

class _EditRelativeScreenState extends State<EditRelativeScreen> {
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
            "Editar perfil",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: Container(),
    );
  }
}
