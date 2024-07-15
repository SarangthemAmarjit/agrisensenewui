import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/data/side_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    GetxPageControler controller = Get.put(GetxPageControler());

    return GetBuilder<GetxPageControler>(builder: (_) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: controller.islightmode
            ? lightcardBackgroundColor
            : cardBackgroundColor,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    height: 80,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: data.menu.length,
                itemBuilder: (context, index) =>
                    buildMenuEntry(data, index, controller),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildMenuEntry(
      SideMenuData data, int index, GetxPageControler controller) {
    controller.isselectedbool(index: index);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: controller.isselected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          if (index == 2) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Log Out'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      context.router.replaceNamed('/');
                    },
                    child: const Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.router.maybePop(false),
                    child: const Text('No'),
                  ),
                ],
              ),
            );
          } else {
            controller.changewidget(index: index);
          }
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: controller.isselected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: controller.isselected ? Colors.black : Colors.grey,
                fontWeight:
                    controller.isselected ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
