import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:SMSI/Utils/animations.dart';
import 'package:SMSI/Utils/update_data.dart';
import 'package:SMSI/constants/color.dart';
import 'package:SMSI/constants/constant.dart';
import 'package:SMSI/controllers/auth_controller.dart';
import 'package:SMSI/models/health_card.dart';
import 'package:SMSI/routes.dart';
import 'package:SMSI/views/charts/line_chart.dart';

class HealthDataDetailWidget extends StatefulWidget {
  final int id;

  const HealthDataDetailWidget({super.key, required this.id});

  @override
  State<HealthDataDetailWidget> createState() => _HealthDataDetailWidgetState();
}

class _HealthDataDetailWidgetState extends State<HealthDataDetailWidget> {
  Constant constant = Constant();
  RxList<HealthCard> healthDataCard = RxList<HealthCard>();
  final authController = Get.find<AuthController>();
  final dataUpdater = UpdateData();

  @override
  void initState() {
    super.initState();
    if (authController.isLogged.value) dataUpdater.startUpdatingData();
    constant.healthData().then((value) => setState(() {
          healthDataCard.clear();
          healthDataCard.assignAll(value);

          ever(healthDataCard, (callback) => {setState(() {})});
        }));
  }

  String? data(int index) {
    switch (index) {
      case 0:
        return "${authController.currentUser.value.bracelet!.heartRate} bpm";
      case 1:
        return "${authController.currentUser.value.bracelet!.bloodPressure} mmHg";
      case 2:
        return "${authController.currentUser.value.bracelet!.bloodOxygen} %";
      case 3:
        return "${authController.currentUser.value.bracelet!.bodyTemperature} ºC";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    dataUpdater.stopUpdating();
  }

  @override
  Widget build(BuildContext context) {
    if (healthDataCard.isEmpty) {
      return const CircularProgressIndicator(color: Colors.purple);
    }
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.homePage);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            backgroundColor: primaryColor,
            title: Text(
              healthDataCard[widget.id].title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            )),
        body: Container(
            color: backgroundColor,
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.healthDetailPage);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.purple, Colors.purpleAccent]),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  blurStyle: BlurStyle.inner)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Medida",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Hero(
                                  tag: widget.id,
                                  child: Image.asset(
                                    healthDataCard[widget.id].icon,
                                    color: Colors.white,
                                    height: 100,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Flexible(
                                      child: Text(data(widget.id)!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32))),
                                ),
                                const Text(
                                  "Estado normal",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                  AspectRatio(
                      aspectRatio: 1.6,
                      child: const BarChart1().animate(
                          effects: Animations.imageOnPageLoadAnimation1)),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(healthDataCard[widget.id].description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                  )
                ])));
  }
}
