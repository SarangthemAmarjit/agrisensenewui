import 'dart:developer';

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
    double screenheight = MediaQuery.of(context).size.height;

    double screenwidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // color: Colors.white,
          height: screenheight / 1.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
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
                                  itemBuilder: (BuildContext context, int ind) {
                                    return Container(
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0),
                                            child: Text(
                                              index == 0
                                                  ? controller
                                                          .allsoildatamaplast10[
                                                              ind]['field3']
                                                          .toString()
                                                          .isEmpty
                                                      ? 'N.A'
                                                      : "${controller.allsoildatamaplast10[ind]['field3']}"
                                                  : index == 1
                                                      ? controller
                                                              .allsoildatamaplast10[
                                                                  ind]['field2']
                                                              .toString()
                                                              .isEmpty
                                                          ? 'N.A'
                                                          : "${controller.allsoildatamaplast10[ind]['field2']}"
                                                      : index == 2
                                                          ? controller
                                                                  .allsoildatamaplast10[
                                                                      ind]
                                                                      ['field7']
                                                                  .toString()
                                                                  .isEmpty
                                                              ? 'N.A'
                                                              : "${controller.allsoildatamaplast10[ind]['field7']}"
                                                          : "N.A",
                                              style: TextStyle(
                                                  color: ind % 2 == 1
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontSize: screenwidth / 45),
                                            ),
                                          ),
                                          title: Text(
                                            DateFormat('h:mm a').format(
                                                controller
                                                    .alldatetimelast10[ind]),
                                            style: TextStyle(
                                                color: ind % 2 == 1
                                                    ? Colors.black
                                                    : Colors.black,
                                                fontSize: screenwidth / 45),
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
    );
  }
}
