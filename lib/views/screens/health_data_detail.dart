import 'package:flutter/material.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/routes.dart';

class HealthDataDetailWidget extends StatefulWidget {
  const HealthDataDetailWidget({super.key});

  @override
  State<HealthDataDetailWidget> createState() => _HealthDataDetailWidgetState();
}

class _HealthDataDetailWidgetState extends State<HealthDataDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, RouteGenerator.homePage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: primaryColor,
          title: const Text(
            "Batimento Cardiaco",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Icon(
                              Icons.monitor_heart_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text("182 mmHG",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32)),
                            ),
                            Text(
                              "Estado normal",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                      textAlign: TextAlign.justify,
                      "A pressão arterial diz respeito à pressão que o sangue faz na parede das artérias. Aumentos permanentes nos valores de pressão arterial podem provocar complicações",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                )
              ])),
    );
  }
}
