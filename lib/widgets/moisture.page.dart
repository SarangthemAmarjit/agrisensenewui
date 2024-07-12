import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// TODO: to change the page name

@RoutePage()
class WebCommonGraphPage extends StatelessWidget {
  final int index;
  const WebCommonGraphPage({super.key, required this.index});

  // final List<DateTime> DateData = [
  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    double screenheight = MediaQuery.of(context).size.height;

    double screenwidth = MediaQuery.of(context).size.width;

//!    from datetime import datetime
//! sales_data = datetime(2019, 1, 1, 12, 34)  # Year: 2019, Month: 1, Day: 1, Hour: 12, Minute: 34

    // final List<Moisture> moisturChartData = [
    //   Moisture(DateTime(2045, 1, 1, 01, 00), 76),
    //   Moisture(DateTime(2045, 1, 1, 02, 00), 56),
    //   Moisture(DateTime(2045, 1, 1, 03, 00), 43),
    //   Moisture(DateTime(2045, 1, 1, 04, 00), 21),
    //   Moisture(DateTime(2045, 1, 1, 07, 00), 56),
    //   Moisture(DateTime(2045, 1, 1, 08, 00), 87),
    //   Moisture(DateTime(2045, 1, 1, 09, 00), 65),
    //   Moisture(DateTime(2045, 1, 1, 10, 00), 21),
    //   Moisture(DateTime(2045, 1, 1, 11, 00), 34),
    //   Moisture(DateTime(2045, 1, 1, 12, 00), 67),
    // ];

    return GetBuilder<GetxTapController>(builder: (_) {
      return Expanded(
        child: Card(
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Center(
                    child: SfCartesianChart(
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                        ),
                        zoomPanBehavior: controller.zoomPanBehavior,
                        primaryXAxis: const DateTimeAxis(
                            autoScrollingMode: AutoScrollingMode.end,
                            initialZoomPosition: 1,
                            initialZoomFactor: 0.01),
                        series: <CartesianSeries>[
                      // Renders line chart
                      LineSeries<Moisture, DateTime>(
                          isVisibleInLegend: true,
                          initialIsVisible: true,
                          name: index == 0
                              ? "Moisture Level"
                              : index == 1
                                  ? "Temperature"
                                  : index == 2
                                      ? "pH Level"
                                      : "",
                          enableTooltip: true,
                          markerSettings: const MarkerSettings(isVisible: true),
                          dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              labelPosition: ChartDataLabelPosition.inside),
                          dataSource:

                              //! above codes to be used for dateTime
                              // moisturChartData,
                              _getData(index: index, controller: controller),
                          xValueMapper: (Moisture moisture, _) => moisture.time,
                          yValueMapper: (Moisture moisture, _) =>
                              moisture.moisture)
                    ]))),
          ),
        ),
      );
    });
  }

  List<Moisture> _getData(
      {required int index, required GetxTapController controller}) {
    List<Moisture> data = [];
    for (int i = 0; i < controller.allsoildatamap.length; i++) {
      if (controller.allsoildatamap.isNotEmpty) {
        data.add(Moisture(
            controller.alldatetime[i],
            index == 0
                ? controller.allsoildatamap[i]['field3'].toString().isEmpty
                    ? 0
                    : double.parse(controller.allsoildatamap[i]['field3'])
                : index == 1
                    ? controller.allsoildatamap[i]['field2'].toString().isEmpty
                        ? 0
                        : double.parse(controller.allsoildatamap[i]['field2'])
                    : index == 2
                        ? controller.allsoildatamap[i]['field7']
                                .toString()
                                .isEmpty
                            ? 0
                            : double.parse(
                                controller.allsoildatamap[i]['field7'])
                        : 0));
      }
    }
    return data;
  }
}

class Moisture {
  Moisture(this.time, this.moisture);
  final DateTime time;
  final double moisture;
}
