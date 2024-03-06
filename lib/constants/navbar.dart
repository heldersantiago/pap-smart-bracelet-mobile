import 'package:flutter/material.dart';
import 'package:pap/views/screens/appointment_view.dart';
import 'package:pap/views/screens/auth/login_view.dart';
import 'package:pap/views/screens/home_view.dart';
import 'package:pap/views/screens/message_view.dart';
import 'package:pap/views/screens/settings_views.dart';

List<Widget> _screens = [
  HomeView(),
  // Message Screen
  const MessageView(),
  // Schedule Screen
  const AppointmentView(),
  // Settings Screen
  const SettingsView(),

  const LoginView(),
];
