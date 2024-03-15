import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pap/views/screens/device_screen.dart';
import 'package:pap/views/screens/onboarding/onboarding_screen.dart';
import 'package:pap/views/screens/profile_screen.dart';
import 'package:pap/views/screens/welcome_screen.dart';
import 'package:pap/views/widgets/list_tile_settings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Definições",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30),
            ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/doctors.png"),
                ),
                title: Text(
                  "Jamal Adjani",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                subtitle: Text(
                  "Filho",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                )),
            Divider(height: 15),
            SizedBox(height: 20),
            ListTileSettings(
              icon: CupertinoIcons.person,
              title: "Perfil",
              colorShape: Color.fromARGB(255, 187, 222, 251),
              colorIcon: Colors.blue,
              screen: ProfileScreen(),
            ),
            SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.notifications_none_outlined,
              title: "Notificações",
              colorShape: Color.fromARGB(255, 197, 202, 233),
              colorIcon: Colors.indigo,
              screen: ProfileScreen(),
            ),
            SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.broadcast_on_home_outlined,
              title: "Dispositivo",
              colorShape: Color.fromARGB(255, 200, 230, 201),
              colorIcon: Colors.green,
              screen: DeviceScreen(),
            ),
            SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.info_outline_rounded,
              title: "Sobre Nós",
              colorShape: Color.fromARGB(255, 255, 224, 178),
              colorIcon: Colors.orange,
              screen: ProfileScreen(),
            ),
            SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.policy,
              title: "Termos e Políticas",
              colorShape: Color.fromARGB(255, 225, 190, 231),
              colorIcon: Colors.purple,
              screen: ProfileScreen(),
            ),
            SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.help_outline_rounded,
              title: "Central de Ajuda",
              colorShape: Color.fromARGB(255, 255, 236, 179),
              colorIcon: Colors.amber,
              screen: ProfileScreen(),
            ),
            SizedBox(height: 10),
            Divider(height: 15),
            SizedBox(height: 20),
            ListTileSettings(
              icon: Icons.logout,
              title: "Terminar sessão",
              colorShape: Color.fromARGB(255, 255, 205, 210),
              colorIcon: Colors.red,
              screen: OnboardingView(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
