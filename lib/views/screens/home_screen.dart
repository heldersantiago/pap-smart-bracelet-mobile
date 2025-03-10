import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pap/Utils/animations.dart';
import 'package:pap/Utils/update_data.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/constants/constant.dart';
import 'package:pap/controllers/auth_controller.dart';
import 'package:pap/models/health_card.dart';
import 'package:pap/routes.dart';
import 'package:pap/services/alerts_service.dart';
import 'package:pap/services/local_notifications.dart';
import 'package:pap/views/charts/radial_chart.dart';
import 'package:pap/views/widgets/drawer_items.dart';
import 'package:pap/views/widgets/health_data_card_section.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> symptoms = Constant().symptoms;
  Constant constant = Constant();
  final alertService = AlertService();
  List<HealthCard> healthDataCard = [];

  final authController = Get.put(AuthController());
  final dataUpdater = UpdateData();

  listenToNotifications() {
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.pushNamed(context, RouteGenerator.notificationPage,
          arguments: event);
    });
  }

  @override
  void initState() {
    listenToNotifications();
    super.initState();
    if (authController.isLogged.value) dataUpdater.startUpdatingData();
    constant.healthData().then((value) => setState(() {
          healthDataCard = value.toList();
        }));
  }

  @override
  void dispose() {
    super.dispose();
    dataUpdater.stopUpdating();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "SMSI",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: DrawerItems() // The Expanded drawer view
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  spreadRadius: 4)
                            ]),
                        width: 200,
                        height: 200,
                        child: RadialChart1()
                            .animate(effects: Animations.radialChartOnLoad)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 4)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: backgroundColor, shape: BoxShape.circle),
                            child: const Icon(Icons.home_filled,
                                color: primaryColor, size: 35),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Página Inicial",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          const Text("Sistema - SMSI",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Controle sua Saúde com o SMSI",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )),
            SizedBox(
                height: 70,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: symptoms.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Center(
                          child: Text(
                            symptoms[index],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      );
                    })),
            const SizedBox(height: 15),
            // Container(
            //   width: 500,
            //   height: 350,
            //   child: RadialChart1()
            //       .animate(effects: Animations.imageOnPageLoadAnimation1),
            // ),
            const SizedBox(height: 15),
            healthDataCard.isNotEmpty
                ? HealthDataCardSection(
                    healthDataCard: healthDataCard,
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  )
            // The List view of health data
          ],
        ),
      ),
    );
  }
}
