import 'package:auto_route/auto_route.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/screencheck.dart';
import 'package:fitness_dashboard_ui/screenhomepagecheck.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class AuthcheckPage extends StatefulWidget {
  const AuthcheckPage({super.key});

  @override
  State<AuthcheckPage> createState() => _AuthcheckPageState();
}

class _AuthcheckPageState extends State<AuthcheckPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getauth();
  }

  void getauth() async {
    GetxTapController controller2 = Get.put(GetxTapController());

    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('islogin')) {
    } else {
      controller2.clearlogindata();
    }
  }

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    return GetBuilder<GetxTapController>(builder: (context) {
      if (controller.islogin) {
        return const HomePage();
      } else {
        return ResponsivePage();
      }
    });
  }
}
