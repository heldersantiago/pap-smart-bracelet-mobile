import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pap/models/health_card.dart';

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

  final List<HealthCard> healthdatas = [
    HealthCard(
        title: "Batimento cardiaco",
        subtitle: "Batimento cardiaco",
        icon: CupertinoIcons.heart_slash_fill,
        textColor: Colors.black),
    HealthCard(
        title: "Pressão arterial",
        subtitle: "Veja aqui a sua pressão",
        icon: Icons.track_changes_sharp,
        textColor: Colors.green),
    HealthCard(
        title: "Oxigénio no Sangue",
        subtitle: "Tudo sobre o seu oxigénio",
        icon: Icons.gas_meter_outlined,
        textColor: Colors.orange),
    HealthCard(
        title: "Temperatura Corporal",
        subtitle: "A temperatura do corpo",
        icon: CupertinoIcons.thermometer,
        textColor: Colors.pink)
  ];
}
