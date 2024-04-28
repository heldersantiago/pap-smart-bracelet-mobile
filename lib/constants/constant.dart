import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/models/health_card.dart';

class Constant extends GetxService {
  final AuthController authController = Get.find<AuthController>();
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

  Future<RxList<HealthCard>> healthData() async {
    return RxList<HealthCard>.of([
      HealthCard(
        title: "Batimento cardiaco",
        subtitle: "Batimento cardiaco",
        icon: "images/lined_heart.png",
        textColor: Colors.purple,
        value: authController.currentUser.value.bracelet!.heartRate != null
            ? "${authController.currentUser.value.bracelet?.heartRate} bpm"
            : "",
        description:
            "A frequência cardíaca é o número de vezes que o coração bate por minuto e o valor normal, em adultos",
      ),
      HealthCard(
        title: "Pressão arterial",
        subtitle: "Veja aqui a sua pressão",
        icon: "images/heart_rate.png",
        textColor: Colors.purple,
        value: authController.currentUser.value.bracelet!.bloodPressure != null
            ? "${authController.currentUser.value.bracelet?.bloodPressure} mmHg"
            : "",
        description:
            "A pressão arterial diz respeito à pressão que o sangue faz na parede das artérias. Aumentos permanentes nos valores de pressão arterial podem provocar complicações",
      ),
      HealthCard(
        title: "Oxigénio no Sangue",
        subtitle: "Tudo sobre o seu oxigénio",
        icon: "images/air-conditioner.png",
        textColor: Colors.purple,
        value: authController.currentUser.value.bracelet!.bloodOxygen != null
            ? "${authController.currentUser.value.bracelet?.bloodOxygen} %"
            : "",
        description:
            "A saturação de oxigênio refere-se à porcentagem de oxigênio que os glóbulos vermelhos transportam do pulmão para o resto do corpo.",
      ),
      HealthCard(
        title: "Temperatura Corporal",
        subtitle: "A temperatura do corpo",
        icon: "images/temperature1.png",
        textColor: Colors.purple,
        value: authController.currentUser.value.bracelet!.bodyTemperature !=
                null
            ? "${authController.currentUser.value.bracelet?.bodyTemperature} ºC"
            : "",
        description:
            "A temperatura normal do corpo varia entre 36,1ºC e 37,2ºC, com oscilações ao longo do dia que normalmente não ultrapassam os 0,6ºC.",
      ),
    ].obs); // O método obs() torna a lista observável
  }
}
