import 'dart:developer';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetxPageControler extends GetxController {
  //CHANGE WIDGET BOOL
  bool _isdashboard = true;
  bool get isdashboard => _isdashboard;
  bool _issettiing = false;
  bool get issettiing => _issettiing;
  bool _issignout = false;
  bool get issignout => _issignout;
  bool _isselected = false;
  bool get isselected => _isselected;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _islightmode = false;
  bool get islightmode => _islightmode;

  void resetpageindex() {
    _isdashboard = true;

    _issettiing = false;

    _issignout = false;
    update();
  }

  void signout() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('islogin');
    prefs.remove('channelid');

    update();
  }

  void isselectedbool({required int index}) {
    if (_selectedIndex == index) {
      _isselected = true;
    } else {
      _isselected = false;
    }
  }

  void changewidget({required int index}) {
    _selectedIndex = index;

    update();

    switch (index) {
      case 0:
        _isdashboard = true;
        _issettiing = false;
        _issignout = false;
        update();
        break;
      case 1:
        _issettiing = true;
        _isdashboard = false;
        _issignout = false;
        update();
        break;
      case 2:
        _issignout = true;
        _isdashboard = false;
        _issettiing = false;

        update();
        break;
      default:
    }
  }

  void setthemecolor({required bool islight}) {
    _islightmode = islight;
    update();
  }

  void opendrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closedrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.white,
            size: 50,
          ),
        );
      },
    );
  }

  Future? _showLoadingDialog(BuildContext context) {
    showDialog(
      useSafeArea: true,
      context: context,
      barrierDismissible: false, // Prevents dialog from being dismissed
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/images/loading3.json',
                  height: 100,
                ),
                const Text(
                  'Please wait...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
    return null;
  }
}
