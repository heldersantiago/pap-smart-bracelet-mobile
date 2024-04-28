import 'package:flutter/material.dart';
import 'package:pap/views/screens/alerts_screen.dart';
import 'package:pap/views/screens/health_states.dart';
import 'package:pap/views/screens/home_screen.dart';
import 'package:pap/views/screens/location_screen.dart';

// Screens in bottom home screen
List<Widget> screens = [
  HomeScreen(),
  const AlertsScreen(),
  // const HealthStateScreen(),
  const LocationScreen(),
];
