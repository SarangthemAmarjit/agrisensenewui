import 'package:auto_route/auto_route.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/screens/main_screen.dart';
import 'package:fitness_dashboard_ui/screens/mobile/pages/dashboard.dart';
import 'package:fitness_dashboard_ui/screens/mobile/pages/servererrorpage.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/loginpage.dart';
import 'package:fitness_dashboard_ui/widgets/mobileloginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive.isMobile(context) ? WebHomePage() : WebHomePage());
  }
}