import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/widgets/npkhistory.dart';
import 'package:fitness_dashboard_ui/widgets/widget/historywidget.dart';
import 'package:fitness_dashboard_ui/widgets/widget/pumpdashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    return GetBuilder<GetxTapController>(builder: (_) {
      return Container(
        decoration: const BoxDecoration(
          color: cardBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              PumpWidget(),
              // SizedBox(height: 16),
              // SummaryDetails(),
              SizedBox(height: 40),
              controller.dropdownindex == 3
                  ? NPKhistoyWidget()
                  : HistoryWidget(index: controller.dropdownindex),
            ],
          ),
        ),
      );
    });
  }
}
