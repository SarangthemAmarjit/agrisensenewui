import 'package:auto_route/auto_route.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';

import 'package:fitness_dashboard_ui/screencheck.dart';
import 'package:fitness_dashboard_ui/screens/main_screen.dart';
import 'package:fitness_dashboard_ui/screens/mobile/pages/servererrorpage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class AuthcheckPage extends StatelessWidget {
  const AuthcheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    return GetBuilder<GetxTapController>(builder: (context) {
      if (controller.isserverok) {
        if (controller.islogin) {
          // If the screen width is less than 600, return the mobile view
          return WebHomePage();
        } else {
          // If the screen width is 600 or more, return the web view
          return const ResponsivePage();
        }
      } else {
        return const ServerErrorPage();
      }
    });
  }
}
