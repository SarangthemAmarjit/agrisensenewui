import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/router/router.dart';

import 'package:fitness_dashboard_ui/screens/main_screen.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Agri Sense',
      builder: EasyLoading.init(),
      theme: ThemeData(
          scaffoldBackgroundColor:
              Responsive.isMobile(context) ? null : backgroundColor,
          brightness:
              Responsive.isMobile(context) ? Brightness.light : Brightness.dark,
          fontFamily: 'KulimPark',
          useMaterial3: true
          /* light theme settings */
          ),
    );
  }
}
