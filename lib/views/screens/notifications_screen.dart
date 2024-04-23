import 'package:flutter/material.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/routes.dart';
import 'package:pap/views/pages/alerts_page.dart';
import 'package:pap/views/pages/notification_page.dart';
import 'package:pap/views/pages/risks_page.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _buttonIndex = 0;

  final _notificationWidgets = [
    const NotificationPage(),
    const AlertsPage(),
    const RisksPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.homePage);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            backgroundColor: primaryColor,
            title: const Text(
              "Central de notificações",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(itemCount: 4,itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 1)
                  ]),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: const Text(
                    "Nivel de Oxigenio",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: const CircleAvatar(child: Icon(Icons.notifications)),
                  subtitle: const Text("Seu nivel de oxigenio esta baixando, recomonde a descansar"),
                  trailing: const Icon(Icons.remove_red_eye_outlined),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Notification"),
                            content: const Text("Any notifications coming"),
                            actions: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Fechar"),
                              ),
                            ],
                          );
                        });
                  },
                ),
              ),
            );
          }),
        ));
  }
}
