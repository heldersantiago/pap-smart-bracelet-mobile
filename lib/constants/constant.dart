import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constant {
  final List<String> symptoms = [
    "Batimento Cardiaco",
    "Pressão arterial",
    "Localização",
    "Oxigénio no sangue",
    "Temperatura corporal",
    "Estado físico",
    "Alertas",
  ];
  final List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor5.jpg"
  ];

  // Vital Data Cards
  final List<String> cardName = [
    "Batimento Cardíaco",
    "Pressão arterial",
    "Oxigénio no sangue",
    "Temperatura corporal",
  ];

  final List<IconData> cardIcons = [
    CupertinoIcons.heart_solid,
    CupertinoIcons.heart_slash_fill,
    Icons.gas_meter_outlined,
    Icons.thermostat,
    // Add more icons as needed
  ];
}
