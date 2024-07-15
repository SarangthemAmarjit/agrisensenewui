import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
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
    GetxPageControler controller2 = Get.put(GetxPageControler());

    GetxTapController controller = Get.put(GetxTapController());
    double screenheight = MediaQuery.of(context).size.height;

    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<GetxTapController>(builder: (_) {
      return GetBuilder<GetxPageControler>(builder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: controller2.islightmode
                ? lightcardBackgroundColor
                : cardBackgroundColor,
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
                FittedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                          // height: screenheight / 82,
                          ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              size: screenwidth / 80,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "HISTORY",
                                style: TextStyle(
                                    fontSize: screenwidth / 80,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenheight / 82,
                      ),
                    ],
                  ),
                ),
                controller.dropdownindex == 3
                    ? NPKhistoyWidget()
                    : HistoryWidget(index: controller.dropdownindex),
              ],
            ),
          ),
        );
      });
    });
  }
}
