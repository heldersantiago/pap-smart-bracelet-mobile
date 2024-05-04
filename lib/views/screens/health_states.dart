import 'package:flutter/material.dart';
import 'package:SMSI/constants/color.dart';
import 'package:SMSI/routes.dart';

class HealthStateScreen extends StatelessWidget {
  const HealthStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Text(""),
        title: const Text(
          "Estado da saúde",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
