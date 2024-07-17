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

    return Scaffold(
      key: controller.scaffoldKey,
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
      body: GetBuilder<GetxPageControler>(builder: (_) {
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
            ],
          ),
        );
      }),
    );
  }
}
