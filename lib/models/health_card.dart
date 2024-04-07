import 'package:flutter/cupertino.dart';

class HealthCard {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color textColor;
  final String description;
  final String value;

  HealthCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.textColor,
    required this.description,
    required this.value,
  });
}
