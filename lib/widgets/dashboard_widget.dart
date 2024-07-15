import 'dart:developer';

import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:fitness_dashboard_ui/widgets/overviewpage.dart';
import 'package:fitness_dashboard_ui/widgets/header_widget.dart';
import 'package:fitness_dashboard_ui/widgets/graph.dart';
import 'package:fitness_dashboard_ui/widgets/historypage.dart';
import 'package:fitness_dashboard_ui/widgets/side_menu_widget.dart';
import 'package:fitness_dashboard_ui/widgets/widget/pumpdashboard.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  DashboardWidget({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  'assets/images/appbartitle4.png',
                  colorBlendMode: BlendMode.colorDodge,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  log('Open Drwawer');
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 18),

              const ActivityDetailsCard(),
              const SizedBox(height: 18),
              Responsive.isDesktop(context) || (Responsive.isDesktop(context))
                  ? const LineChartCard()
                  : PumpWidget(),

              const SizedBox(height: 18),
              if (Responsive.isTablet(context)) const PumpWidget(),
              // SizedBox(height: 16),
              // SummaryDetails(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
