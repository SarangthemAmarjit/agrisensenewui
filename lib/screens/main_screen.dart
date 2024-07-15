import 'package:auto_route/auto_route.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/dashboard_widget.dart';
import 'package:fitness_dashboard_ui/widgets/side_menu_widget.dart';
import 'package:fitness_dashboard_ui/widgets/historypage.dart';
import 'package:fitness_dashboard_ui/widgets/themewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetxPageControler controller = Get.put(GetxPageControler());
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      body: GetBuilder<GetxPageControler>(builder: (_) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(
          //   image: controller.islightmode
          //       ? DecorationImage(
          //           opacity: 0.2,
          //           image: AssetImage('assets/images/bg.png'),
          //           fit: BoxFit.cover)
          //       : null,
          // ),
          child: SafeArea(
            child: controller.issettiing || controller.issignout
                ? Row(
                    children: [
                      if (isDesktop)
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: SideMenuWidget(),
                          ),
                        ),
                      Expanded(
                        flex: 10,
                        child: ThemePage(),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      if (isDesktop)
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: SideMenuWidget(),
                          ),
                        ),
                      Expanded(
                        flex: 7,
                        child: DashboardWidget(),
                      ),
                      if (isDesktop)
                        Expanded(
                          flex: 3,
                          child: SummaryWidget(),
                        ),
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
