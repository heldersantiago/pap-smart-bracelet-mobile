import 'package:flutter/material.dart';
import 'package:pap/views/widgets/color.dart';
import 'package:pap/views/widgets/upcoming.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _buttonIndex = 0;

  final _notificationWidgets = [
    const Upcoming(),
    const Center(child: Text("Sem alertas no momento")),
    const Center(child: Text("Sem mensagem de risco no momento")),
  ];
  @override
  Widget build(BuildContext contiext) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Dados da Saúde",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: const Color(0xfff4f6fa),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _buttonIndex = 0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _buttonIndex == 0
                            ? primaryColor
                            : Colors.transparent),
                    child: Text("Noticações",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 0
                                ? Colors.white
                                : Colors.black54)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _buttonIndex = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _buttonIndex == 1
                            ? primaryColor
                            : Colors.transparent),
                    child: Text("Alertas",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 1
                                ? Colors.white
                                : Colors.black54)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _buttonIndex = 2;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _buttonIndex == 2
                            ? primaryColor
                            : Colors.transparent),
                    child: Text("Riscos",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 2
                                ? Colors.white
                                : Colors.black54)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _notificationWidgets[_buttonIndex]
        ],
      ),
    ));
  }
}
