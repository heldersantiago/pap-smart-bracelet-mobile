import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SMSI/Utils/update_data.dart';
import 'package:SMSI/Utils/utils.dart';
import 'package:SMSI/constants/color.dart';
import 'package:SMSI/controllers/auth_controller.dart';
import 'package:SMSI/models/alert.dart';
import 'package:SMSI/services/alerts_service.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertsScreen> {
  // Declare a Completer
  Completer<String?> dialogCompleter = Completer<String?>();

  late AlertService alertService = Get.find<AlertService>();
  late RxList<Alert> _notificationWidgets;
  final authController = Get.find<AuthController>();
  final dataUpdater = UpdateData();

  @override
  void initState() {
    if (authController.isLogged.value) dataUpdater.startUpdatingData();
    super.initState();
    alertService = Get.find<AlertService>();
    // Update _notificationWidgets when alerts change
    _notificationWidgets = alertService.alerts;
  }

  @override
  void dispose() {
    super.dispose();
    dataUpdater.stopUpdating();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: Text(""),
            backgroundColor: primaryColor,
            title: const Text(
              "Central de Notificações",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
        body: Obx(() => _notificationWidgets.length > 0
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: _notificationWidgets.length,
                    itemBuilder: (context, index) {
                      final alert = _notificationWidgets[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            title: Text(
                              alert.title!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: const CircleAvatar(
                                child: Icon(Icons.notifications)),
                            subtitle: Text(alert.description!),
                            trailing: const Icon(Icons.remove_red_eye_outlined),
                            onTap: () async {
                              final resut = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(alert.title!),
                                      content: Text(alert.description!),
                                      actions: <Widget>[
                                        Text(
                                            Utils.formatDate(alert.createdAt!)),
                                        FloatingActionButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Fechar"),
                                        ),
                                      ],
                                    );
                                  });
                              // turn an read alert after open the link
                              await alertService.alertRead(alert.id!);
                            },
                          ),
                        ),
                      );
                    }),
              )
            : const Center(
                child: Text("Sem alertas no momento"),
              )));
  }
}
