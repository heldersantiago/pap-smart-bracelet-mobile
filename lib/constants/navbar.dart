import 'package:flutter/material.dart';
import 'package:SMSI/views/screens/alerts_screen.dart';
import 'package:SMSI/views/screens/health_states.dart';
import 'package:SMSI/views/screens/home_screen.dart';
import 'package:SMSI/views/screens/location_screen.dart';

// Screens in bottom home screen
List<Widget> screens = [
  HomeScreen(),
  const AlertsScreen(),
  // const HealthStateScreen(),
  // const LocationScreen(),
];
