import 'package:flutter/material.dart';
import 'package:pap/views/screens/health_states.dart';
import 'package:pap/views/screens/home_screen.dart';
import 'package:pap/views/screens/notifications_screen.dart';

// Screens in bottom home screen
List<Widget> screens = [
  HomeScreen(),
  const NotificationScreen(),
  const HealthStateScreen(),
];
