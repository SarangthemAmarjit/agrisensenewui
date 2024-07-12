import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/widgets/custom_card_widget.dart';
import 'package:fitness_dashboard_ui/widgets/moisture.page.dart';
import 'package:fitness_dashboard_ui/widgets/soilNPK.page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    return GetBuilder<GetxTapController>(builder: (_) {
      return CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text('Graphical View Type: '),
                    const SizedBox(
                        width:
                            10), // Add some spacing between text and dropdown
                    Card(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          value: controller.dropdownname,
                          hint: const Text('Choose'),
                          items: dropdownItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.changedropdownindex(
                                dropdownvalue: newValue!);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('Time Interval: '),
                      const SizedBox(
                          width:
                              10), // Add some spacing between text and dropdown
                      Card(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            value: controller.dropdowntime,
                            hint: const Text('Choose'),
                            items: timeintervallist.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.settimeinterval(name: newValue!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AspectRatio(
                aspectRatio: 16 / 6,
                child: controller.dropdownindex == 3
                    ? WebSoilNpkPage()
                    : WebCommonGraphPage(index: controller.dropdownindex)),
          ],
        ),
      );
    });
  }
}
