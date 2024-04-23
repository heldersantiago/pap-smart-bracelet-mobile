import 'package:flutter/material.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/constants/navbar.dart';

class NavbarRoots extends StatefulWidget {
  const NavbarRoots({super.key});

  @override
  State<NavbarRoots> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<NavbarRoots> {
  int _selectedIndex = 0;
  final _screens = screens;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
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
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Página Inicial"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active), label: "Alertas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety_outlined), label: "Estados"),
          ],
        ),
      ),
    );
  }
}
