import 'package:flutter/material.dart';
import 'package:SMSI/constants/constant.dart';
import 'package:SMSI/models/health_card.dart';
import 'package:SMSI/views/widgets/health_data_card.dart';

class HealthDataCardSection extends StatefulWidget {
  final List<HealthCard> healthDataCard;

  const HealthDataCardSection({super.key, required this.healthDataCard});

  @override
  State<HealthDataCardSection> createState() => _HealthDataCardSectionState();
}

class _HealthDataCardSectionState extends State<HealthDataCardSection> {
  Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
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
            index: index,
          );
        },
      ),
    );
  }
}
