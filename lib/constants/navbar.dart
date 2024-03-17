import 'package:flutter/material.dart';
import 'package:pap/views/screens/home_screen.dart';
import 'package:pap/views/screens/notifications_screen.dart';
import 'package:pap/views/screens/settings_screen.dart';

// Screens in bottom home screen
List<Widget> screens = [
  HomeScreen(),
  const NotificationScreen(),
  SettingScreen(),
];
