import 'package:flutter/material.dart';
import 'package:SMSI/constants/color.dart';

class DrawerListItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? action;

  const DrawerListItem(
      {super.key, required this.title, required this.icon, this.action});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        action?.call();
      },
      title: Text(
        title,
        style: TextStyle(
          color: primaryColor.withOpacity(.7),
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      leading: Icon(
        icon,
        color: primaryColor,
      ),
    );
  }
}
