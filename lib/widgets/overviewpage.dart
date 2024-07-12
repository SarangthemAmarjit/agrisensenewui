import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/custom_card_widget.dart';
import 'package:fitness_dashboard_ui/widgets/widget/cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    return GetBuilder<GetxTapController>(builder: (_) {
      return GridView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
          mainAxisSpacing: 12.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return GestureDetector(
                child: CardWidgetforSoil(
                  bgimagepath: "assets/images/soilHumidity.png",
                  title: "Soil Humidity",
                  iconpath: "assets/images/humidity.png",
                  index: 0,
                  value: controller.latestfeeddata?.field3,
                ),
                onTap: () {},
              );
            case 1:
              return GestureDetector(
                child: CardWidgetforSoil(
                  bgimagepath: "assets/images/soilTemperature.png",
                  title: "Soil Temperature",
                  iconpath: "assets/images/temp.png",
                  index: 1,
                  value: controller.latestfeeddata?.field2,
                ),
                onTap: () {},
              );
            case 2:
              return GestureDetector(
                child: CardWidgetforSoil(
                  bgimagepath: "assets/images/soilPhLevel.png",
                  title: "Soil pH Level",
                  iconpath: "assets/images/ph.png",
                  index: 2,
                  value: controller.latestfeeddata?.field7,
                ),
                onTap: () {},
              );
            case 3:
              return GestureDetector(
                child: CardWidgetforSoil(
                  bgimagepath: "assets/images/soilNPK.png",
                  title: "Soil NPK",
                  iconpath: "assets/images/npk.png",
                  index: 3,
                  value: controller.latestfeeddata?.field7,
                ),
                onTap: () {},
              );
            default:
          }
          return null;
        },
      );
    });

    // return GridView.builder(
    //   itemCount: healthDetails.healthData.length,
    //   shrinkWrap: true,
    //   physics: const ScrollPhysics(),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
    //     crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
    //     mainAxisSpacing: 12.0,
    //   ),
    //   itemBuilder: (context, index) => CustomCard(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Image.asset(
    //           healthDetails.healthData[index].icon,
    //           width: 30,
    //           height: 30,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 15, bottom: 4),
    //           child: Text(
    //             healthDetails.healthData[index].value,
    //             style: const TextStyle(
    //               fontSize: 18,
    //               color: Colors.white,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //         ),
    //         Text(
    //           healthDetails.healthData[index].title,
    //           style: const TextStyle(
    //             fontSize: 13,
    //             color: Colors.grey,
    //             fontWeight: FontWeight.normal,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
