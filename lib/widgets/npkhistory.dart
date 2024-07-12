import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NPKhistoyWidget extends StatelessWidget {
  const NPKhistoyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<GetxTapController>(builder: (_) {
      return Expanded(
        child: Card(
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              // color: Colors.white,
              height: screenheight / 1.95,
              child: Center(
                child: Column(
                  children: [
                    FittedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.history,
                                  size: screenWidth / 80,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "HISTORY",
                                    style: TextStyle(
                                        fontSize: screenWidth / 80,
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
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          // height: 40,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: screenheight / 108,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(14))),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth / 80,
                                        vertical: screenWidth / 90),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Time",
                                          style: TextStyle(
                                              fontSize: screenWidth / 80,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.red,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'N',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            screenWidth / 80,
                                                        color: Colors.white)),
                                                // const TextSpan(text: 'itrogen'),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.green,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'P',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            screenWidth / 80,
                                                        color: Colors.white)),
                                                // const TextSpan(
                                                //     text: 'hosporous'),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.blue,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'K',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            screenWidth / 80,
                                                        color: Colors.white)),
                                                // const TextSpan(
                                                //     text: 'otassium'),
                                              ],
                                            ),
                                          ),
                                        ),
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
                                      itemCount: controller
                                          .allsoildatamaplast10.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: index % 2 == 0
                                                ? Colors.blueGrey[100]
                                                : Colors.grey[100],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                DateFormat('h:mm a').format(
                                                    controller
                                                            .alldatetimelast10[
                                                        index]),
                                                style: TextStyle(
                                                    color: index % 2 == 1
                                                        ? Colors.black
                                                        : Colors.black,
                                                    fontSize: screenWidth / 80),
                                              ),
                                              Text(
                                                "${controller.allsoildatamaplast10[index]['field4'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field4']}",
                                                style: TextStyle(
                                                    color: index % 2 == 1
                                                        ? Colors.black
                                                        : Colors.blueGrey,
                                                    fontSize: screenWidth / 80),
                                              ),
                                              Text(
                                                "${controller.allsoildatamaplast10[index]['field5'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field5']}",
                                                style: TextStyle(
                                                    color: index % 2 == 1
                                                        ? Colors.black
                                                        : Colors.blueGrey,
                                                    fontSize: screenWidth / 80),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12.0),
                                                child: Text(
                                                  "${controller.allsoildatamaplast10[index]['field6'].toString().isEmpty ? 'N/A' : controller.allsoildatamaplast10[index]['field6']}",
                                                  style: TextStyle(
                                                      color: index % 2 == 1
                                                          ? Colors.black
                                                          : Colors.blueGrey,
                                                      fontSize:
                                                          screenWidth / 80),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
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
                    // SizedBox(
                    //   height: screenheight / 64,
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
