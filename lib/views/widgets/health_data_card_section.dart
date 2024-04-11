import 'package:flutter/material.dart';
import 'package:pap/views/widgets/smart_device_box.dart';

class HealthDataCardSection extends StatefulWidget {
  // final List<HealthCard>? healthDataCard;

  const HealthDataCardSection({super.key});

  @override
  State<HealthDataCardSection> createState() => _HealthDataCardSectionState();
}

class _HealthDataCardSectionState extends State<HealthDataCardSection> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "assets/light-bulb.png", true],
    ["Smart AC", "images/air-conditioner.png", false],
    ["Smart TV", "images/smart-tv.png", false],
    ["Smart Fan", "images/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 0.2,
      child: GridView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3,
        ),
        itemBuilder: (context, index) {
          return SmartDeviceBox(
            smartDeviceName: mySmartDevices[index][0],
            iconPath: mySmartDevices[index][1],
            powerOn: mySmartDevices[index][2],
            onChanged: (value) => powerSwitchChanged(value, index),
          );
        },
      ),
    );
  }
}
