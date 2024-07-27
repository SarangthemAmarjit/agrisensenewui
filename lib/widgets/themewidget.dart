import 'dart:developer';

import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/header_widget.dart';
import 'package:fitness_dashboard_ui/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemePage extends StatelessWidget {
  ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetxPageControler controller = Get.put(GetxPageControler());
    GetxTapController controller2 = Get.put(GetxTapController());

    return Scaffold(
      drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? SizedBox(
              width: 252,
              child: Drawer(
                child: SideMenuWidget(),
              ),
            )
          : null,
      appBar: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? AppBar(
              centerTitle: true,
              title: SizedBox(
                height: 30,
                child: Image.asset(
                  controller.islightmode
                      ? 'assets/images/appbartitle4.png'
                      : 'assets/images/appbartitle4dark.png',
                  colorBlendMode: BlendMode.colorDodge,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  log('Open Drwawer');
                  controller.opendrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            )
          : null,
      body: GetBuilder<GetxTapController>(builder: (context) {
        return GetBuilder<GetxPageControler>(builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          'Dark Mode',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: controller.islightmode
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                      Switch(
                        value: controller.islightmode,
                        onChanged: (value) {
                          controller.setthemecolor(islight: value);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Light Mode',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: controller.islightmode
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'Threshold Value :',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: controller.islightmode
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                    if (controller2.isEditingThreshold)
                      Expanded(
                        child: TextFormField(
                          controller: controller2.thresholdController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                gapPadding: 15,
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Enter threshold',
                          ),
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                            color: controller.islightmode
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            controller2.threshold.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: controller.islightmode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    if (controller2.isEditingThreshold)
                      ElevatedButton(
                        onPressed: () {
                          var value =
                              int.parse(controller2.thresholdController.text);
                          controller2.setthresholdvalue(value: value);
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: controller.islightmode
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          controller2.setEditbutton();
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: controller.islightmode
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        });
      }),
    );
  }
}
