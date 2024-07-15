import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const CustomCard({super.key, this.color, this.padding, required this.child});
  @override
  Widget build(BuildContext context) {
    GetxPageControler controller = Get.put(GetxPageControler());
    return GetBuilder<GetxPageControler>(builder: (_) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: color == null
                ? controller.islightmode
                    ? lightcardBackgroundColor
                    : cardBackgroundColor
                : color,
          ),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(12.0),
            child: child,
          ));
    });
  }
}
