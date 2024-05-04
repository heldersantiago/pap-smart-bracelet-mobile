import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SMSI/constants/color.dart';
import 'package:SMSI/controllers/auth_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChartData extends StatefulWidget {
  @override
  State<RadialChartData> createState() => _RadialChart1State();
}

class _RadialChart1State extends State<RadialChartData> {
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
                PieSeries<GDPData, String>(
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
    ];
    return chartData;
  }
}

class GDPData {
  final String name;
  final dynamic value;

  GDPData(this.name, this.value);
}
