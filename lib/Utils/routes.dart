import 'package:SMSI/routes.dart';
import 'package:flutter/material.dart';
import 'package:SMSI/views/screens/profile_screen.dart';

class Routes{
  static navigateTo(BuildContext context, String route, bool useEffect){
    Navigator.of(context).pushReplacement(
      RouteGenerator.generateRoute(
        RouteSettings(name: route),
        useEffect: useEffect, // Apply transition effect for this route
      ),
    );
  }
}