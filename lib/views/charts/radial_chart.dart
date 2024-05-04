import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SMSI/constants/color.dart';
import 'package:SMSI/controllers/auth_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart1 extends StatefulWidget {
  @override
  State<RadialChart1> createState() => _RadialChart1State();
}

class _RadialChart1State extends State<RadialChart1> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Obx(
          () {
            final chartData = getChartData(authController);
            return SfCircularChart(
              legend: const Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: <CircularSeries>[
                RadialBarSeries<GDPData, String>(
                  dataSource: chartData,
                  xValueMapper: (GDPData data, _) => data.name,
                  yValueMapper: (GDPData data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    overflowMode: OverflowMode.hide,
                    textStyle:
                        TextStyle(fontFamily: 'Outfit', color: primaryColor),
                  ),
                  enableTooltip: true,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<GDPData> getChartData(AuthController u) {
    final List<GDPData> chartData = [
      GDPData(
        "bpm",
        int.parse(u.currentUser.value.bracelet?.heartRate ?? '0'),
      ),
      GDPData(
        "mmHg",
        int.parse(u.currentUser.value.bracelet?.bloodPressure ?? '0'),
      ),
      GDPData(
        "%",
        int.parse(u.currentUser.value.bracelet?.bloodOxygen ?? '0'),
      ),
      GDPData(
        "ºC",
        int.parse(u.currentUser.value.bracelet?.bodyTemperature ?? '0'),
      ),
    ];
    return chartData;
  }
}

class GDPData {
  final String name;
  final dynamic value;

  GDPData(this.name, this.value);
}
