import 'package:flutter/material.dart';

class HealthDetailScreen extends StatelessWidget {
  const HealthDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Hero(
          tag: "sample",
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("images/doctors.png"),
          )),
    );
  }
}
