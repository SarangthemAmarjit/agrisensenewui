import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:fitness_dashboard_ui/router/router.dart';

import 'package:fitness_dashboard_ui/screens/main_screen.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// import 'package:soilmoisturedetector/services/backgroundservoces.dart';

// import 'package:soilmoisturedetector/services/workmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await NotificationService().initNotification();
  // await initializeService();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetxPageControler controller = Get.put(GetxPageControler());

    return GetBuilder<GetxPageControler>(builder: (_) {
      return MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: 'Agri Sense',
        builder: EasyLoading.init(),
        theme: ThemeData(
            scaffoldBackgroundColor:
                controller.islightmode ? lightbackgroundColor : backgroundColor,
            brightness:
                controller.islightmode ? Brightness.light : Brightness.dark,
            fontFamily: 'KulimPark',
            useMaterial3: true
            /* light theme settings */
            ),
      );
    });
  }
}
