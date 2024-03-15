import 'package:flutter/material.dart';
import 'package:pap/views/screens/device_screen.dart';
import 'package:pap/views/screens/home_screen.dart';
import 'package:pap/views/screens/notifications_screen.dart';
import 'package:pap/views/screens/account_screen.dart';

List<Widget> _screens = [
  HomeScreen(),
  const NotificationScreen(),
  const DeviceScreen(),
  const AccountScreen(),
];
