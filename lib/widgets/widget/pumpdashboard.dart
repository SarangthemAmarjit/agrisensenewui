import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PumpWidget extends StatelessWidget {
  const PumpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    GetxPageControler controller2 = Get.put(GetxPageControler());

    return GetBuilder<GetxPageControler>(
      builder: (_) {
        return GetBuilder<GetxTapController>(builder: (_) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      color: controller2.islightmode ? Colors.white : null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 80),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/mode.png",
                                            height: 35,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Pump Mode",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: ToggleSwitch(
                                      cornerRadius: 5,
                                      activeBgColors: const [
                                        [
                                          Color.fromARGB(255, 58, 185, 120),
                                        ],
                                        [
                                          Color.fromARGB(255, 58, 185, 120),
                                        ],
                                      ],
        
                                      // activeFgColor: Colors.green,
                                      // inactiveBgColor:
                                      //     const Color.fromARGB(
                                      //         255, 58, 60, 62),
                                      // inactiveFgColor: Colors.white,
                                      initialLabelIndex:
                                          controller.ismanual ? 1 : 0,
                                      totalSwitches: 2,
                                      labels: const ['Auto', 'Manual'],
                                      radiusStyle: false,
                                      onToggle: (index) {
                                        controller.setwaterpumpmode(
                                            ispoweron: false,
                                            iscomingfrompumpmode: true);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 140),
                                    child: Row(
                                      children: [
                                        controller.field1 == "0"
                                            ? controller.field8.isEmpty ||
                                                    controller.field8 == '0' ||
                                                    controller.field8 == '2'
                                                ? Image.asset(
                                                    "assets/images/pumpOFF.png",
                                                    height: 60,
                                                  )
                                                : Image.asset(
                                                    "assets/images/pumpONgif.gif",
                                                    height: 60,
                                                  )
                                            : controller.field1 == '1'
                                                ? Image.asset(
                                                    "assets/images/pumpONgif.gif",
                                                    height: 60,
                                                  )
                                                : Image.asset(
                                                    "assets/images/pumpOFF.png",
                                                    height: 60,
                                                  ),
        
                                        // Icon(
                                        //   Icons.electrical_services_outlined,
                                        //   size: 32,
                                        //   color: Colors.amber,
                                        // ),
        
                                        const Text(
                                          "Power",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                    child: controller.ispumboff
                                        ? controller.field1 == '1'
                                            ? const SizedBox(
                                                height: 30,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 70),
                                                  child:
                                                      CircularProgressIndicator(),
                                                ))
        
                                            //THIRD PART AFTER PUSHING TURN OFF
                                            : ToggleSwitch(
                                                changeOnTap: true,
                                                minWidth: 55,
                                                minHeight: 40,
                                                cornerRadius: 20.0,
                                                activeBgColors: [
                                                  [
                                                    controller.ismanual
                                                        ? const Color(0xffdc6c73)
                                                        : Colors.grey,
                                                  ],
                                                  const [
                                                    Color.fromARGB(
                                                        255, 60, 205, 130),
                                                  ]
                                                ],
                                                activeFgColor: Colors.white,
                                                inactiveBgColor:
                                                    const Color.fromARGB(
                                                        255, 58, 60, 62),
                                                inactiveFgColor: Colors.white,
                                                initialLabelIndex: controller.field1 ==
                                                        "0"
                                                    ? controller.field8.isEmpty ||
                                                            controller.field8 ==
                                                                '0' ||
                                                            controller.field8 == '2'
                                                        ? 0
                                                        : 1
                                                    : controller.field1 == '2' ||
                                                            controller
                                                                .field1.isEmpty
                                                        ? 0
                                                        : 1,
                                                totalSwitches: 2,
                                                labels: const ['OFF', 'ON'],
                                                radiusStyle: true,
                                                //THIRD PART AFTER PUSHING TURN OFF
                                                onToggle: controller.field1 == '2' ||
                                                        controller.field1.isEmpty
                                                    ? (index) {
                                                        controller.setpump(
                                                            pumpstatus: true,
                                                            context: context,
                                                            ispumboffff: false);
                                                      }
                                                    : (index) {
                                                        controller
                                                            .automationmodeerrordialog(
                                                                context: context);
                                                      })
                                        : controller.pumpStatus
                                            ? controller.field1.isEmpty ||
                                                    controller.field1 == '0' ||
                                                    controller.field1 == '2'
                                                ? const SizedBox(
                                                    height: 30,
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 70),
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ))
                                                :
        
                                                //! using dafault switch
                                                ToggleSwitch(
                                                    changeOnTap: true,
                                                    minWidth: 55,
                                                    minHeight: 40,
                                                    cornerRadius: 20.0,
                                                    activeBgColors: [
                                                      [
                                                        controller.ismanual
                                                            ? const Color(
                                                                0xffdc6c73)
                                                            : Colors.grey,
                                                      ],
                                                      const [
                                                        Color.fromARGB(
                                                            255, 60, 205, 130),
                                                      ]
                                                    ],
                                                    activeFgColor: Colors.white,
                                                    inactiveBgColor:
                                                        const Color.fromARGB(
                                                            255, 58, 60, 62),
                                                    inactiveFgColor: Colors.white,
                                                    initialLabelIndex: controller.field1 ==
                                                            "0"
                                                        ? controller.field8.isEmpty ||
                                                                controller.field8 ==
                                                                    '0' ||
                                                                controller.field8 ==
                                                                    '2'
                                                            ? 0
                                                            : 1
                                                        : controller.field1 == '2' ||
                                                                controller
                                                                    .field1.isEmpty
                                                            ? 0
                                                            : 1,
                                                    totalSwitches: 2,
                                                    labels: const ['OFF', 'ON'],
                                                    radiusStyle: true,
                                                    //AFTER POWER ON TOGGLE PART
                                                    //2ND TOGGLE PART
                                                    onToggle: controller.field1 ==
                                                            '1'
                                                        ? (index) {
                                                            controller.setpump(
                                                                pumpstatus: false,
                                                                context: context,
                                                                ispumboffff: true);
                                                          }
                                                        : (index) {
                                                            controller
                                                                .automationmodeerrordialog(
                                                                    context:
                                                                        context);
                                                          })
                                            : ToggleSwitch(
                                                minWidth: 55,
                                                minHeight: 40,
                                                cornerRadius: 20.0,
                                                changeOnTap: true,
                                                activeBgColors: [
                                                  [
                                                    controller.ismanual
                                                        ? const Color(0xffdc6c73)
                                                        : Colors.grey,
                                                  ],
                                                  const [
                                                    Color.fromARGB(
                                                        255, 60, 205, 130),
                                                  ]
                                                ],
                                                activeFgColor: Colors.white,
                                                inactiveBgColor:
                                                    const Color.fromARGB(255, 58, 60, 62),
                                                inactiveFgColor: Colors.white,
                                                initialLabelIndex: controller.field1 == "0"
                                                    ? controller.field8.isEmpty || controller.field8 == '0' || controller.field8 == '2'
                                                        ? 0
                                                        : 1
                                                    : controller.field1 == '2' || controller.field1.isEmpty
                                                        ? 0
                                                        : 1,
                                                totalSwitches: 2,
                                                labels: const ['OFF', 'ON'],
                                                radiusStyle: true,
                                                //FIRST TOGGLE PART
                                                onToggle: controller.field1 == '2' || controller.field1 == '1'
                                                    ? (index) {
                                                        controller.setpump(
                                                            pumpstatus: true,
                                                            context: context,
                                                            ispumboffff: false);
                                                      }
                                                    : controller.field1=='0'
                                                        ? (index) {
                                                            controller
                                                                .automationmodeerrordialog(
                                                                    context:
                                                                        context);
                                                          }
                                                        : (index) {
                                                            controller
                                                                .manualmodeerrordialog(
                                                                    context:
                                                                        context);
                                                          })),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          )
                          // ),
                          // controller.ismanual
                          //     ? Column(
                          //         children: [
                          //           //! MANUAL TIMER
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment
                          //                     .spaceBetween,
                          //             children: [
                          //               Expanded(
                          //                 child:
                          //                     FittedBox(
                          //                   child:
                          //                       Padding(
                          //                     padding: const EdgeInsets
                          //                         .only(
                          //                         right: 160),
                          //                     child:
                          //                         Row(
                          //                       children: [
                          //                         controller.pumpStatusmanually
                          //                             ? Image.asset(
                          //                                 "assets/images/timer.png",
                          //                                 height: 40,
                          //                               )
                          //                             : Image.asset(
                          //                                 "assets/images/timerOFF.png",
                          //                                 height: 40,
                          //                               ),
                          //                         const Text(
                          //                           "   Manual Timer",
                          //                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
        
                          //               //! using dafault switch
                          //               Transform
                          //                   .scale(
                          //                 scale:
                          //                     1.4,
                          //                 child:
                          //                     Switch(
                          //                   // This bool value toggles the switch.
                          //                   value: controller
                          //                       .pumpStatusmanually,
                          //                   activeColor:
                          //                       Colors.blue,
                          //                   onChanged: controller.pumpStatus
                          //                       ? controller.field8 == '1'
                          //                           ? null
                          //                           : (bool value) {
                          //                               // This is called when the user toggles the switch.
                          //                               controller.setpumpmanually(pumpstatus: value);
                          //                               _minutesController.clear();
                          //                             }
                          //                       : (bool value) {
                          //                           // This is called when the user toggles the switch.
                          //                           controller.setpumpmanually(pumpstatus: value);
                          //                           _minutesController.clear();
                          //                         },
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //           const SizedBox(
                          //             height: 8,
                          //           ),
        
                          //           controller
                          //                   .iswatermanualconfirm
                          //               ? Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     const Text(
                          //                       "Time remaining : ",
                          //                       style:
                          //                           TextStyle(fontSize: 18),
                          //                     ),
                          //                     controller.min > 0
                          //                         ? Text(
                          //                             '${controller.min}min : ${controller.sec < 10 ? '0${controller.sec}sec' : '${controller.sec}sec'}',
                          //                             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                          //                           )
                          //                         : Text(
                          //                             controller.sec < 10 ? '0${controller.sec}sec' : '${controller.sec}sec',
                          //                             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                          //                           )
                          //                   ],
                          //                 )
                          //               : const SizedBox(),
                          //           const SizedBox(
                          //             height: 12,
                          //           ),
        
                          //           controller
                          //                   .pumpStatusmanually
                          //               ? Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceAround,
                          //                   children: [
                          //                     const Text(
                          //                       'Enter Time in Minute :',
                          //                       style:
                          //                           TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          //                     ),
                          //                     Expanded(
                          //                       child:
                          //                           Padding(
                          //                         padding: const EdgeInsets.symmetric(horizontal: 10),
                          //                         child: Card(
                          //                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.black.withOpacity(0.5))),
                          //                           elevation: 5,
                          //                           child: SizedBox(
                          //                             height: 35,
                          //                             child: Center(
                          //                               child: TextField(
                          //                                   textAlign: TextAlign.center,
                          //                                   controller: _minutesController,
                          //                                   keyboardType: TextInputType.number,
                          //                                   enabled: !controller.iswatermanualconfirm,
                          //                                   decoration: const InputDecoration.collapsed(
                          //                                     hintText: '',
                          //                                   ),
                          //                                   onChanged: null),
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     const SizedBox(
                          //                         width: 16.0),
                          //                     ElevatedButton(
                          //                       style:
                          //                           ButtonStyle(shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Colors.red))), backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 149, 219, 153))),
                          //                       onPressed: controller.iswatermanualconfirm
                          //                           ? null
                          //                           : () {
                          //                               controller.updateTimerValue(timerforpump: int.parse(_minutesController.text));
                          //                               showDialog(
                          //                                 context: context,
                          //                                 builder: (context2) => AlertDialog(
                          //                                   backgroundColor: Colors.white,
                          //                                   title: const Text('Task Confirmation'),
                          //                                   content: Text('Are You Sure To Pump Water for ${_minutesController.text} Minute?'),
                          //                                   actions: [
                          //                                     Row(
                          //                                       mainAxisAlignment: MainAxisAlignment.end,
                          //                                       children: [
                          //                                         ElevatedButton(
                          //                                             style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.grey[200], side: BorderSide(color: Colors.grey[700]!)),
                          //                                             onPressed: () {
                          //                                               context2.router.pop();
                          //                                             },
                          //                                             child: Text(
                          //                                               "CANCEL",
                          //                                               style: TextStyle(color: Colors.red[300]!, fontWeight: FontWeight.bold),
                          //                                             )),
                          //                                         Padding(
                          //                                           padding: const EdgeInsets.only(left: 10),
                          //                                           child: ElevatedButton(
                          //                                               style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.green[200], side: BorderSide(color: Colors.green[700]!)),
                          //                                               onPressed: () {
                          //                                                 context2.router.maybePop();
                          //                                                 controller.startTimer(context: context);
        
                          //                                                 if (controller.field8 == '1') {
                          //                                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //                                                     behavior: SnackBarBehavior.fixed,
                          //                                                     backgroundColor: Colors.green,
        
                          //                                                     content: Text('Water Pump Activated For ${_minutesController.text} Min'),
                          //                                                     duration: const Duration(seconds: 3), // Adjust the duration as needed
                          //                                                   ));
                          //                                                 }
                          //                                               },
                          //                                               child: const Text(
                          //                                                 "OK",
                          //                                                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          //                                               )),
                          //                                         )
                          //                                       ],
                          //                                     ),
                          //                                   ],
                          //                                 ),
                          //                               );
                          //                             },
                          //                       child:
                          //                           const Text('Go'),
                          //                     ),
                          //                   ],
                          //                 )
                          //               : const SizedBox()
                          //         ],
                          //       )
                          //     : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      }
    );
  }
}
