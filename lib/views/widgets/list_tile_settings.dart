import 'package:flutter/material.dart';
import 'package:pap/views/screens/auth/login_screen.dart';
import 'package:pap/views/screens/profile_screen.dart';

class ListTileSettings extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color colorIcon;
  final Color colorShape;

  const ListTileSettings({
    required this.icon,
    required this.title,
    required this.colorShape,
    required this.colorIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
      },
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: colorShape, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: colorIcon,
          size: 35,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
