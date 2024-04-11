import 'package:flutter/material.dart';
import 'package:pap/constants/constant.dart';
import 'package:pap/models/health_card.dart';
import 'package:pap/views/widgets/health_data_card.dart';

class HealthDataCardSection extends StatefulWidget {
  final List<HealthCard> healthDataCard;

  const HealthDataCardSection({super.key, required this.healthDataCard});

  @override
  State<HealthDataCardSection> createState() => _HealthDataCardSectionState();
}

class _HealthDataCardSectionState extends State<HealthDataCardSection> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  Constant constant = Constant();

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Batimento Cardiaco", "images/light-bulb.png", true],
    ["Temperatura corporal", "images/air-conditioner.png", true],
    ["Smart TV", "images/smart-tv.png", true],
    ["Smart Fan", "images/fan.png", true],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        itemCount: widget.healthDataCard.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 1),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1 / 1.5,
        ),
        itemBuilder: (context, index) {
          return HealthDataCard(
            smartDeviceName: widget.healthDataCard[index].title,
            iconPath: widget.healthDataCard[index].icon,
          );
        },
      ),
    );
  }
}
