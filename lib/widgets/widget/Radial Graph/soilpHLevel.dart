import 'dart:developer';

import 'package:fitness_dashboard_ui/constant/gradient.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialIndicatorSoil extends StatelessWidget {
  final String? value;

  const RadialIndicatorSoil({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    log(value.toString());
    GetxTapController controller = Get.put(GetxTapController());
    GetxPageControler controller2 = Get.put(GetxPageControler());
    return GetBuilder<GetxPageControler>(builder: (_) {
      return Obx(
        () => controller.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : screenWidth > 800 && screenWidth < 1000
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        value == null || value!.isEmpty ? 'N/A' : '$value%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 50,
                        ),
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: SvgPicture.asset(
                          'assets/images/Soil Temperature Sensor.svg',
                        ),
                      ),
                    ],
                  )
                : SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                        maximum: 14,

                        annotations: [
                          GaugeAnnotation(
                              angle: 90,
                              positionFactor: 0.5,
                              widget: FittedBox(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      value == null || value!.isEmpty
                                          ? 'N/A'
                                          : double.parse(value!) < 10
                                              ? '0$value'
                                              : value!,
                                      style: TextStyle(
                                        color: controller2.islightmode
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth < 800
                                            ? screenWidth / 30
                                            : screenWidth / 70,
                                      ),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: controller2.islightmode
                                          ? Colors.blueGrey
                                          : Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: SizedBox(
                                          width: Responsive.isMobile(context)
                                              ? screenWidth / 6
                                              : screenWidth / 12,
                                          child: Center(
                                            child: Text(
                                              value == null || value!.isEmpty
                                                  ? 'N/A'
                                                  : double.parse(value!) > 7.5
                                                      ? 'Alkaline'
                                                      : double.parse(value!) >
                                                              6.5
                                                          ? 'Neutral'
                                                          : 'Acidic',
                                              style: TextStyle(
                                                color: controller2.islightmode
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: screenWidth < 800
                                                    ? screenWidth / 30
                                                    : screenWidth / 80,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                        ticksPosition: ElementsPosition.inside,
                        minimum: 0,

                        showLabels: true, // Show labels on the axis
                        labelOffset: 10, // Offset to adjust label position
                        ranges: <GaugeRange>[
                          GaugeRange(
                            gradient: SweepGradient(
                              colors: <Color>[
                                Colors.red.withOpacity(0.9),
                                Colors.red.withOpacity(0.5),
                              ],
                            ),
                            label: 'Acidic',
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'KulimPark',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            startValue: 0,
                            endValue: 6.5,
                          ),
                          GaugeRange(
                            color: Colors.yellow.withOpacity(0.9),
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'KulimPark',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            label: 'Neutral',
                            startValue: 6.5,
                            endValue: 7.5,
                          ),
                          GaugeRange(
                            gradient: SweepGradient(
                              colors: <Color>[
                                Colors.blue.withOpacity(0.5),
                                Colors.blue.withOpacity(0.9),
                              ],
                            ),
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'KulimPark',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            label: 'Alkaline',
                            startValue: 7.5,
                            endValue: 14,
                          )
                        ],
                        useRangeColorForAxis: true,

                        showTicks: true,
                        // useRangeColorForAxis: true,
                        // ranges: [GaugeRange(startValue: double.parse(value), endValue: 100)],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                              needleEndWidth: 4,
                              knobStyle: const KnobStyle(borderWidth: 2),
                              needleColor:
                                  const Color.fromARGB(255, 210, 86, 86),
                              enableAnimation: true,
                              animationDuration: 1500,
                              animationType: AnimationType.bounceOut,
                              value: value == null || value!.isEmpty
                                  ? 0.0
                                  : double.parse(value!)),
                        ],
                      ),
                    ],
                  ),
      );
    });
  }
}
