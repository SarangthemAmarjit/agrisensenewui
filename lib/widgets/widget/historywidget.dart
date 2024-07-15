import 'dart:developer';

import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryWidget extends StatelessWidget {
  final int index;
  HistoryWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    GetxPageControler controller2 = Get.put(GetxPageControler());
    double screenheight = MediaQuery.of(context).size.height;

    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<GetxPageControler>(builder: (_) {
      return GetBuilder<GetxTapController>(builder: (_) {
        return Expanded(
          child: Card(
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: BoxDecoration(
                    color: controller2.islightmode ? Colors.white : null,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: screenheight / 1.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12, top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: controller2.islightmode
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14))),
                          // height: 40,
                          child: SizedBox(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: screenheight / 108,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                          color: controller2.islightmode
                                              ? Colors.orange[100]
                                              : Colors.teal[100],
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(14))),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenwidth / 80,
                                          vertical: screenwidth / 90),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenwidth / 80,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            index == 0
                                                ? "Moisture Level"
                                                : index == 1
                                                    ? "Temperature"
                                                    : index == 2
                                                        ? "pH Level"
                                                        : "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenwidth / 80,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount:
                                            controller.alldatetimelast10.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int ind) {
                                          return Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: ind % 2 == 0
                                                  ? Colors.blueGrey[100]
                                                  : Colors.grey[100],
                                            ),
                                            child: ListTile(
                                                // leading: Icon(
                                                //   Icons.av_timer,
                                                //   size: screenwidth / 32,
                                                // ),
                                                trailing: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 6.0),
                                                  child: Text(
                                                    index == 0
                                                        ? controller
                                                                .allsoildatamaplast10[
                                                                    ind]
                                                                    ['field3']
                                                                .toString()
                                                                .isEmpty
                                                            ? 'N.A'
                                                            : "${controller.allsoildatamaplast10[ind]['field3']}"
                                                        : index == 1
                                                            ? controller
                                                                    .allsoildatamaplast10[
                                                                        ind][
                                                                        'field2']
                                                                    .toString()
                                                                    .isEmpty
                                                                ? 'N.A'
                                                                : "${controller.allsoildatamaplast10[ind]['field2']}"
                                                            : index == 2
                                                                ? controller
                                                                        .allsoildatamaplast10[
                                                                            ind]
                                                                            [
                                                                            'field7']
                                                                        .toString()
                                                                        .isEmpty
                                                                    ? 'N.A'
                                                                    : "${controller.allsoildatamaplast10[ind]['field7']}"
                                                                : "N.A",
                                                    style: TextStyle(
                                                        color: ind % 2 == 1
                                                            ? Colors.black
                                                            : Colors.black,
                                                        fontSize:
                                                            screenwidth / 80),
                                                  ),
                                                ),
                                                title: Text(
                                                  DateFormat('h:mm a').format(
                                                      controller
                                                              .alldatetimelast10[
                                                          ind]),
                                                  style: TextStyle(
                                                      color: ind % 2 == 1
                                                          ? Colors.black
                                                          : Colors.black,
                                                      fontSize:
                                                          screenwidth / 80),
                                                )),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenheight / 64,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
