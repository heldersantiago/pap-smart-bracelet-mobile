import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final String buttonText;
  final Widget view;
  const ButtonAuth({super.key, required this.buttonText, required this.view});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0XFF7165D6),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => view));
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
