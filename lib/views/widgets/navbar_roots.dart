import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/constants/navbar.dart';
import 'package:pap/services/alerts_service.dart';

class NavbarRoots extends StatefulWidget {
  const NavbarRoots({super.key});

  @override
  State<NavbarRoots> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<NavbarRoots> {
  int _selectedIndex = 0;
  final _screens = screens;
  final alertservice = Get.find<AlertService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Obx(() => BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.black54,
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "Página Inicial"),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.notifications_active),
                    label: "Alertas (${alertservice.alerts.length})"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.location_on_sharp), label: "Localização"),
              ],
            )),
      ),
    );
  }
}
