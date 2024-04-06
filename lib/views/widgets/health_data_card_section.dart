import 'package:flutter/material.dart';
import 'package:pap/constants/color.dart';
import 'package:pap/models/health_card.dart';
import 'package:pap/routes.dart';

class HealthDataCardSection extends StatelessWidget {
  final List<HealthCard> healthDataCard;

  const HealthDataCardSection({super.key, required this.healthDataCard});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: healthDataCard.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.healthDetailPage);
          },
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.outer)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          healthDataCard[index].icon,
                          color: healthDataCard[index].textColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          healthDataCard[index].title,
                          style: TextStyle(
                              color: healthDataCard[index].textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward,color: healthDataCard[index].textColor ,size: 28),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                                  colors: [Colors.purple, Colors.redAccent],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)
                              .createShader(bounds);
                        },
                        child: Text(healthDataCard[index].subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ),
                    ),
                    Icon(healthDataCard[index].icon,
                        color: healthDataCard[index].textColor, size: 50)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
