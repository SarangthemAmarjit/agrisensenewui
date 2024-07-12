import 'package:auto_route/annotations.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
@RoutePage()
class WebSoilNpkPage extends StatelessWidget {
  WebSoilNpkPage({super.key});

  final List<DateTime> dateData = [
    DateTime(2024, 1, 1, 1, 00),
    DateTime(2024, 1, 1, 2, 00),
    DateTime(2024, 1, 1, 3, 00),
    DateTime(2024, 1, 1, 4, 00),
    DateTime(2024, 1, 1, 5, 00),
    DateTime(2024, 1, 1, 6, 00),
    DateTime(2024, 1, 1, 7, 00),
    DateTime(2024, 1, 1, 8, 00),
    DateTime(2024, 1, 1, 9, 00),
    DateTime(2024, 1, 1, 10, 00),
    DateTime(2024, 1, 1, 11, 00),
    DateTime(2024, 1, 1, 12, 00),

    // Add more DateTime values as needed
  ];

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<GetxTapController>(builder: (_) {
      return Column(
        children: [
          Expanded(
            child: Card(
              elevation: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Center(
                        child: SfCartesianChart(
                            legend: const Legend(
                              position: LegendPosition.top,
                              isResponsive: true,
                              isVisible: true,
                            ),
                            zoomPanBehavior: controller.zoomPanBehavior,
                            primaryXAxis: const DateTimeAxis(
                                autoScrollingMode: AutoScrollingMode.end,
                                initialZoomPosition: 1,
                                initialZoomFactor: 0.01),
                            series: <CartesianSeries>[
                          // Renders line chart
                          LineSeries<SoilNPK, DateTime>(
                              legendItemText: "Nitrogen",
                              color: Colors.red,
                              dataSource: _getData(controller: controller),
                              xValueMapper: (SoilNPK soilnpk, _) =>
                                  soilnpk.time,
                              yValueMapper: (SoilNPK N, _) => N.N),
                          LineSeries<SoilNPK, DateTime>(
                              animationDelay: 300,
                              color: Colors.green,
                              legendItemText: "Phosphorous",
                              dataSource: _getData(controller: controller),
                              //  chartData,
                              xValueMapper: (SoilNPK soilnpk, _) =>
                                  soilnpk.time,
                              yValueMapper: (SoilNPK P, _) => P.P),
                          LineSeries<SoilNPK, DateTime>(
                              animationDelay: 600,
                              color: Colors.blue,
                              legendItemText: "Potassium",
                              dataSource: _getData(controller: controller),
                              //  chartData,
                              xValueMapper: (SoilNPK soilnpk, _) =>
                                  soilnpk.time,
                              yValueMapper: (SoilNPK K, _) => K.K)
                        ]))),
              ),
            ),
          ),
        ],
      );
    });
  }

  List<SoilNPK> _getData({required GetxTapController controller}) {
    List<SoilNPK> data = [];
    for (int i = 0; i < controller.allsoildatamap.length; i++) {
      data.add(SoilNPK(
          controller.alldatetime[i],
          controller.allsoildatamap[i]['field4'].toString().isEmpty
              ? 0
              : double.parse(controller.allsoildatamap[i]['field4']),
          controller.allsoildatamap[i]['field5'].toString().isEmpty
              ? 0
              : double.parse(controller.allsoildatamap[i]['field5']),
          controller.allsoildatamap[i]['field6'].toString().isEmpty
              ? 0
              : double.parse(controller.allsoildatamap[i]['field6'])));
    }
    return data;
  }
}

class SoilNPK {
  SoilNPK(this.time, this.N, this.P, this.K);
  final DateTime time;
  final double N;
  final double P;
  final double K;
}
