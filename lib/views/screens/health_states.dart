import 'package:flutter/material.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/routes.dart';

class HealthStateScreen extends StatelessWidget {
  const HealthStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          color: backgroundColor,
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteGenerator.homePage);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Estado da saude",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
