import 'package:flutter/material.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/routes.dart';

class HealthDataCard extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final int index;

  HealthDataCard({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(
              context, RouteGenerator.healthDetailPage,
              arguments: index);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // icon
                Hero(
                  tag: index,
                  child: Image.asset(
                    iconPath,
                    height: 90,
                    color: Colors.white,
                  ),
                ),

                // smart device name + switch
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          smartDeviceName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
