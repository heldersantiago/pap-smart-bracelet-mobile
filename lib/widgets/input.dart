import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final IconData icon;
  const Input({super.key, required this.labelText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            prefixIcon: Icon(icon)),
      ),
    );
  }
}
