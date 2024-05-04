import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SMSI/constants/color.dart';

class ButtonAuth extends StatelessWidget {
  final String buttonText;
  final String view;
  const ButtonAuth({super.key, required this.buttonText, required this.view});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Get.offAndToNamed(view);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
