import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fitness_dashboard_ui/constant/constant.dart';
import 'package:fitness_dashboard_ui/model/soilmodel.dart';
import 'package:fitness_dashboard_ui/services/localnotification.dart';
import 'package:fitness_dashboard_ui/util/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class GetxTapController extends GetxController {
  //setter
  Getallsoildetails? latestdata;
  Getallsoildetails? alldata;
  List _allsoildatamap = [];
  List _allsoildatamaplast10 = [];
  final List _allfeed = [];
  Feed? _latestfeeddata;
  // 5 minutes in seconds
  Timer? _timer;
  int pumptimer = 0;
  int _min = 0;
  int _sec = 0;
  // THRESHOLD VALUE
  bool _isEditingThreshold = false;
  bool get isEditingThreshold => _isEditingThreshold;
  int _thresholdvalue = 50;
  final TextEditingController thresholdController = TextEditingController();

  int? _savethresholdvalue;
  int? get savethresholdvalue => _savethresholdvalue;

  int get threshold => _thresholdvalue;

  bool _ismanualwaterconfirm = false;
  bool _istabonnotification = true;
  var isDataLoading = false.obs;
  bool _pumpStatusmanually = false;
  bool _isserverok = true;
  bool _pumpStatus = false;
  bool _islogin = false;
  bool get islogin => _islogin;
  bool _ispumboff = false;
  bool get ispumboff => _ispumboff;

  bool _ismanual = false;
  bool get ismanual => _ismanual;

  DateTime? _createddate;
  DateTime? get createddate => _createddate;
  String _channelid = '';
  String get channelid => _channelid;
  String _soiltitle = '';

  double _progressValue = 0.0;
  double get progressvalue => _progressValue;
  Timer? _circulartimer;
  Timer? _field8checkingtimer;
  String _field8 = '';
  String get field8 => _field8;

  String _field1 = '';
  String get field1 => _field1;
  Timer? _scheduletimer;
  List<DateTime> _alldatetime = [];
  List<DateTime> _alldatetimelast10 = [];
  late ZoomPanBehavior zoomPanBehavior;
  String _dropdowname = dropdownItems.first;
  String get dropdownname => _dropdowname;

  String? _dropdowntime;
  String? get dropdowntime => _dropdowntime;

  int? _timeinterval;
  int? get timeinterval => _timeinterval;

  int _dropdownindex = 0;
  int get dropdownindex => _dropdownindex;
  //getter
  bool get istabonnotification => _istabonnotification;
  bool get isserverok => _isserverok;
  List get allsoildatamap => _allsoildatamap;
  List get allsoildatamaplast10 => _allsoildatamaplast10;
  Timer get scheduletimer => _scheduletimer!;
  bool get iswatermanualconfirm => _ismanualwaterconfirm;
  List get allfeed => _allfeed;
  Feed? get latestfeeddata => _latestfeeddata;
  bool get pumpStatusmanually => _pumpStatusmanually;
  bool get pumpStatus => _pumpStatus;
  int get min => _min;
  int get sec => _sec;
  String get soiltitle => _soiltitle;
  List<DateTime> get alldatetime => _alldatetime;
  List<DateTime> get alldatetimelast10 => _alldatetimelast10;
  var data = <Feed>[].obs;

  final advancedDrawerController = AdvancedDrawerController();
  @override
  Future<void> onInit() async {
    super.onInit();
    thresholdController.text = threshold.toString();
    getData();
    Future.delayed(const Duration(seconds: 1))
        .whenComplete(() => FlutterNativeSplash.remove());
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Rx<VisualType?> selectedVisualType = Rx<VisualType?>(null);

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _scheduletimer!.cancel();
    super.dispose();
  }
//SET THEME

  void handleMenuButtonPressed({required bool isopendrawer}) {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    if (isopendrawer) {
      advancedDrawerController.showDrawer();
    } else {
      advancedDrawerController.hideDrawer();
    }
  }

  void clearlogindata() {
    _scheduletimer!.cancel();
    _islogin = false;
    _channelid = '';
    update();
  }

  void settimeinterval({required String name}) {
    int ind = timeintervallist.indexOf(name);
    if (ind == 0) {
      _timeinterval = 5;
      update();
      getalldata();
    } else if (ind == 1) {
      _timeinterval = 15;

      update();
      getalldata();
    } else {
      _timeinterval = 30;

      update();
      getalldata();
    }
    _dropdowntime = name;
    update();
  }

  void setontapnotification() {
    _istabonnotification = true;

    update();
    log(_istabonnotification.toString());
  }

  void getzoompan() {
    zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
      zoomMode: ZoomMode.x,
      enableSelectionZooming: true,
    );
  }

  void setEditbutton() {
    _isEditingThreshold = true;
    update();
  }

  void getthreshold() async {
    final prefs = await SharedPreferences.getInstance();
    _savethresholdvalue = prefs.getInt('threshold');
    _thresholdvalue = _savethresholdvalue!;
    update();
  }

  void setthresholdvalue({required int value}) async {
    final prefs = await SharedPreferences.getInstance();

    _isEditingThreshold = false;
    _thresholdvalue = value;
    update();
    prefs.setInt('threshold', value);
    getthreshold();
  }

  void automatictoggle() {}

  void monitorbackgroundservice(ServiceInstance service) {
    _istabonnotification = true;
    update();
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          if (latestfeeddata != null) {
            if (latestfeeddata!.field3.isEmpty) {
              log('empty value');
            } else {
              int? value = _savethresholdvalue == null
                  ? _thresholdvalue
                  : _savethresholdvalue;
              if (int.parse(latestfeeddata!.field3) < value!) {
                service.setForegroundNotificationInfo(
                    title: 'ALERT ⚠️ ⚠️ ', content: 'Low Soil Moisture Level');
                log('istab checking ${_istabonnotification.toString()} ');
                if (_istabonnotification) {
                  log('istab is  false');
                  NotificationService().showalarmwarning(
                      title: '⚠️Critical Soil Moisture Level⚠️ ',
                      body: 'Tap Here Soon to Pump the Water');

                  _istabonnotification = false;
                  update();
                } else {
                  log('istab is  true');
                }
              } else {
                _istabonnotification = true;
                update();
                // NotificationService().calcelnotification();
                service.setForegroundNotificationInfo(
                    title: 'Agri Sense',
                    content:
                        'Current Soil Moisture Level : ${latestfeeddata == null ? '' : latestfeeddata!.field3}');
              }
            }
          } else {
            service.setForegroundNotificationInfo(
                title: 'Agri Sense', content: 'SERVER ERROR');
          }
        }
      }
    });
  }

  void _startTimer() {
    // Create a periodic timer that executes the function every 5 seconds
    _scheduletimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      getlatestfeeddata();
      getalldata();
    });
  }

  String? validateChannelId(String? channelId) {
    const List<String> validChannelIds = ['698633', '760525'];

    if (channelId == null || channelId.isEmpty) {
      return 'Please enter your Channel ID';
    } else if (!validChannelIds.contains(channelId)) {
      return 'Invalid Channel ID. Please enter a valid one.';
    } else {
      _channelid = channelId;
      _islogin = true;
      update();
      _startTimer();
      getlatestfeeddata();
      getalldata();
      getzoompan();
      saveData();
      log('CHANNEL ID : ' + channelId.toString());
      return null;
    }
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('islogin', true);
    await prefs.setString('channelid', _channelid);
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    // if (prefs.containsKey('threshold')) {
    //   getthreshold();
    // }
    if (prefs.containsKey('islogin')) {
      _islogin = prefs.getBool('islogin')!;
      _channelid = prefs.getString('channelid')!;
      update();
      log('islogin :' + _islogin.toString());
      if (_islogin) {
        if (_isserverok) {
          _startTimer();
          getlatestfeeddata();
          getalldata();
          getzoompan();
        }
      }
    }
  }

  void getsoildetailaccordingtoindex({required int index}) {
    switch (index) {
      case 0:
        _soiltitle = 'Soil Humidity';
        update();
        break;
      case 1:
        _soiltitle = 'Soil Temperature';
        update();
        break;
      case 2:
        _soiltitle = 'Soil PH Level';
        update();
        break;
      default:
    }
  }

  void setradiobuttoncancellationhandle() {
    selectedVisualType.value = null;
  }

  void updateSelectedVisualType(
      {required VisualType value, required int timerforpump}) {
    selectedVisualType.value = value;
    pumptimer = timerforpump * 60;
    update();
  }

  void updateTimerValue({required int timerforpump}) {
    pumptimer = timerforpump * 60;
    update();
  }

  void setpumpmanually({
    required bool pumpstatus,
  }) {
    _pumpStatusmanually = pumpstatus;
    selectedVisualType.value = null;
    if (_timer != null) {
      _timer!.cancel();
      _ismanualwaterconfirm = false;
      _pumpStatus = false;
      _min = 0;
      _sec = 0;
      update();
    }
    update();
  }

  void startTimeforcheckingfield8() {
    log('Timer Started');
    const duration = Duration(seconds: 1);

    _field8checkingtimer = Timer.periodic(duration, (Timer timer) {
      if (_latestfeeddata!.created == _createddate) {
        // Increment progress value every second until it reaches 20 seconds
        _progressValue +=
            0.05; // Increment by 0.05 every second (100% / 20 seconds = 0.05)
        update();
        if (_progressValue >= 1.0) {
          _field8checkingtimer?.cancel();
          _pumpStatus = false;
          _progressValue = 0.0;
          update();
          setwaterpumpmode(ispoweron: false, iscomingfrompumpmode: false);
        }
      } else {
        _progressValue = 1.0;
        _field8checkingtimer?.cancel();
        update();
      }
    });
  }

  void automationmodeerrordialog({required BuildContext context}) {
    AwesomeDialog(
      width: Responsive.isMobile(context) ? null : 600,
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: 'ERROR',
      desc: '⚠️⚠️ In Automation Mode You cannot Change Power Mode',
      btnOkOnPress: () {},
    ).show();
  }

  void manualmodeerrordialog({required BuildContext context}) {
    AwesomeDialog(
      width: Responsive.isMobile(context) ? null : 600,
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: 'ERROR',
      desc: '⚠️⚠️ Set the Pump Mode to Manual First',
      btnOkOnPress: () {},
    ).show();
  }

  void startTimeforcircular({required BuildContext context}) {
    log('Timer Started');
    const duration = Duration(seconds: 1);

    _circulartimer = Timer.periodic(duration, (Timer timer) {
      if (_field1.isEmpty || _field1 == '0' || _field1 == '2') {
        // Increment progress value every second until it reaches 5 seconds
        _progressValue += 0.2;
        update(); // Increment by 0.2 every second (100% / 5 seconds = 0.2)
        if (_progressValue >= 1.0) {
          _circulartimer?.cancel();
          _pumpStatus = false;
          _progressValue = 0.0;
          update();
          AwesomeDialog(
            width: Responsive.isMobile(context) ? null : 600,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: 'ERROR',
            desc: 'Pump Activation Failed⚠️⚠️ Check Wire is connected Properly',
            btnOkOnPress: () {},
          ).show();

          //      showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     title: const Text('Error'),
          //     content: const Text('Pump Activation Failed⚠️⚠️ Check Wire is connected Properly'),
          //     actions: [
          //        ElevatedButton(
          //         onPressed: () => context.router.pop(),
          //         child: const Text('OK'),
          //       ),

          //     ],
          //   ),
          // );

          //  EasyLoading.showError('Error Pump Activation Failed⚠️⚠️ Check Wire is connected Properly');
        }
      } else {
        _progressValue = 1.0;
        _circulartimer?.cancel();
        update();
      }
    });
  }

  Timer? _powerontimer;
  void powerontimer({required BuildContext context}) {
    const int initialTime = 1 * 60; // 10 minutes in seconds
    int _remainingTime = initialTime;
    log('Power On Timer Starter');
    _powerontimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime >= 55) {
        _remainingTime--;
      } else if (_remainingTime < 55) {
        if (_field1 == '1') {
          _remainingTime--;
        } else {
          log('Power On Timer off');
          _powerontimer?.cancel();
        }
      } else {
        _powerontimer?.cancel();
        // setwaterpump(isActive: false);
        setwaterpumpmode(ispoweron: false, iscomingfrompumpmode: false);
        AwesomeDialog(
          width: Responsive.isMobile(context) ? null : 600,
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.topSlide,
          title: 'Confirm',
          desc:
              'Water Pump Continously on for 10 min. Do you want to pump for another 10 min?',
          btnCancelText: 'NO',
          btnOkText: 'YES',
          btnOkOnPress: () {
            setwaterpumpmode(ispoweron: true, iscomingfrompumpmode: false);
            powerontimer(context: context);
          },
          btnCancelOnPress: () {},
        ).show();
      }
    });
  }

  void _callFunctionforpumpoff() {
    _ispumboff = false;
    update();

    // Your function to be called after 5 seconds
    print('Function called after 5 seconds');
  }

  void _callFunctionforpoweron() {
    _pumpStatus = false;
    update();

    // Your function to be called after 5 seconds
    print('Function called after 5 seconds');
  }

  void setpump(
      {required bool pumpstatus,
      required bool ispumboffff,
      required BuildContext context}) {
    log('Pump oFF :$ispumboffff');
    _pumpStatus = pumpstatus;
    _ispumboff = ispumboffff;
    update();
    if (ispumboffff) {
      Future.delayed(Duration(seconds: 5), _callFunctionforpumpoff);
    }

    if (pumpstatus) {
      Future.delayed(Duration(seconds: 5), _callFunctionforpoweron);
      setwaterpumpmode(ispoweron: true, iscomingfrompumpmode: false);
      // setwaterpump(isActive: true);
      powerontimer(context: context);
      // startTimeforcircular(context: context);

      // NotificationService().showNotification(
      //     title: 'Water Pump Activated 🚰',
      //     body: 'Your water pump 💦 has been switched on successfully');
    } else {
      if (_ismanualwaterconfirm) {
        if (_timer != null) {
          // setwaterpump(isActive: false);
          _timer!.cancel();
          _ismanualwaterconfirm = false;
          _pumpStatus = false;
          _min = 0;
          _sec = 0;
          selectedVisualType.value = null;
          update();
        }
      } else {
        setwaterpumpmode(ispoweron: false, iscomingfrompumpmode: false);
        // setwaterpump(isActive: false);
        // NotificationService().showNotification(
        //     title: 'Water Pump Deactivated 🚰',
        //     body: 'Your water pump 💦 has been switched off successfully');
      }
    }
  }

  Future getlatestfeeddata() async {
    if (latestdata == null) {
      isDataLoading(true);
    }

    try {
      final queryParameters = {
        "api_key": "330F3444455D4923",
      };
      final response = await http.get(
        Uri.http('10.10.1.139:88', '/api/channel-data/$_channelid/latest-feeds',
            queryParameters),
      );

      if (response.statusCode == 200) {
        _isserverok = true;
        update();
        var users = getallsoildetailsFromJson(response.body);

        if (latestdata == null) {
          latestdata = users;
          _latestfeeddata = latestdata!.feeds.last;
          _createddate = _latestfeeddata!.created;

          update();
        } else {
          if (users == latestdata) {
            if (_field8checkingtimer == null) {
              if (_latestfeeddata!.field8 == '1') {
                log('Field8 is 1');
                startTimeforcheckingfield8();
              }
            }

            log('Data Already same');
          } else {
            log('222222222222222222222222222222222');
            isDataLoading(true);
            latestdata = users;
            _latestfeeddata = latestdata!.feeds.last;
            _field8 = _latestfeeddata!.field8;
            _field1 = _latestfeeddata!.field1;
            if (_field1 == '0' || _field1.isEmpty) {
              _ismanual = false;
              _pumpStatus = false;
              update();
            } else {
              _ismanual = true;
              update();
            }

            log('FIELD 1 :$_field1');
            update();
          }
        }
      } else {
        print('Failedrerer to Getdata.');
        Future.delayed(const Duration(seconds: 5)).whenComplete(() {
          _isserverok = false;
          update();
        });
      }
      return null;
    } catch (e) {
      Future.delayed(const Duration(seconds: 5)).whenComplete(() {
        _isserverok = false;
        update();
      });
      print(e.toString());
    } finally {
      isDataLoading(false);
    }
  }

  void changedropdownindex({required String dropdownvalue}) {
    int ind = dropdownItems.indexOf(dropdownvalue);
    _dropdowname = dropdownvalue;
    _dropdownindex = ind;
    update();
  }

  void setwaterpumpmode(
      {required bool ispoweron, required bool iscomingfrompumpmode}) async {
    if (iscomingfrompumpmode) {
      _ismanual = !_ismanual;

      update();
    }
    // if (_ismanual) {
    //   if (!ispoweron) {
    //     _ispumboff = true;
    //     update();
    //   }
    // } else {
    //   _pumpStatus = true;
    //   update();
    // }
    log('ISmanual :' + _ismanual.toString());
    log('PUMP STATUS :' + _pumpStatus.toString());

    log('Field 2 ${_latestfeeddata!.field2}');
    try {
      final queryParameters = {
        "api_key": "8D35B69579284707",
        'field1': _ismanual
            ? ispoweron
                ? '1'
                : '2'
            : '0',
        "field2": _latestfeeddata!.field2,
        "field3": _latestfeeddata!.field3,
        "field4": _latestfeeddata!.field4,
        "field5": _latestfeeddata!.field5,
        "field6": _latestfeeddata!.field6,
        "field7": _latestfeeddata!.field7,
        "field8": _latestfeeddata!.field8,
      };

      final response = await http.post(
        Uri.http('10.10.1.139:88', '/api/channel-data/update', queryParameters),
      );
      if (response.statusCode == 200) {
        log('Successfuly Set Mode');
        getlatestfeeddata();
      } else {
        log('error water mode set');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getalldata() async {
    log('Time interval : $_timeinterval');
    try {
      // log("All soil date 10 list$_allsoildatamaplast10");
      final queryParameters = {
        "api_key": "330F3444455D4923",
        "interval": _timeinterval == null ? '60' : '$_timeinterval'
      };
      final response = await http.get(
        Uri.http('10.10.1.139:88', '/api/channel-data/$_channelid/feeds',
            queryParameters),
      );
      // var soildata = jsonEncode(response.body);
      Map<String, dynamic> dec = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var users = getallsoildetailsFromJson(response.body);
        alldata = users;
        _allsoildatamap = dec['feeds'];
        _alldatetime = [];

        update();
        log('length herer :${_allsoildatamap.length}');
        if (_allsoildatamap.length > 10) {
          var last10 = _allsoildatamap.sublist(_allsoildatamap.length - 10);

          _allsoildatamaplast10 = last10.reversed.toList();
          log('length greter than 10 :${_allsoildatamaplast10.length}');
          // log("All soil date 10 list$_allsoildatamaplast10");
          update();
        } else {
          var last10 = _allsoildatamap;

          _allsoildatamaplast10 = last10.reversed.toList();

          update();
          log('length less than 10 :${_allsoildatamap.length}');
        }

        for (var element in alldata!.feeds) {
          if (_alldatetime.contains(element.created)) {
          } else {
            _alldatetime.add(element.created);
          }
        }
        if (alldatetime.length > 10) {
          var last10datetime = _alldatetime.sublist(_alldatetime.length - 10);
          _alldatetimelast10 = last10datetime.reversed.toList();

          update();
        } else {
          var last10datetime = _alldatetime;
          _alldatetimelast10 = last10datetime.reversed.toList();

          update();
        }
      } else {
        print('Failedrerer to GetAlldata.');
      }
      return null;
    } finally {}
  }

  // Future setwaterpump({
  //   required bool isActive,
  // }) async {
  //   try {
  //     final queryParameters = {
  //       "id": 698633,
  //       "isactive": isActive,
  //     };
  //     final response = await http.post(
  //       Uri.http('10.10.1.139:88', '/api/channel-data/change-active',
  //           queryParameters),
  //     );
  //     log('Set Water Pump Response ;${response.statusCode}');

  //     if (response.statusCode == 200) {
  //       log('Successfully switch water pump');
  //       getlatestfeeddata();
  //     } else {
  //       print('Failedrerer to Getdata.');
  //     }
  //     return null;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  void startTimer({required BuildContext context}) {
    _pumpStatus = true;
    update();
    setwaterpumpmode(ispoweron: _pumpStatus, iscomingfrompumpmode: false);
    startTimeforcircular(context: context);
    if (_field1 == '1') {
      // setwaterpump(isActive: true);
      // NotificationService().showNotification(
      //     title: 'Water Pump Activated',
      //     body: 'Water Pump Activated for ${pumptimer ~/ 60} min');
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (pumptimer > 0) {
          pumptimer--;

          _min = (pumptimer / 60).floor();
          _sec = pumptimer % 60;
          update();
        } else {
          _timer!.cancel(); // Stop the timer when it reaches 0
          // Add your desired action when the countdown reaches 0 here

          _ismanualwaterconfirm = false;
          // setwaterpump(isActive: false);
          _pumpStatus = false;
          _min = 0;
          _sec = 0;
          selectedVisualType.value = null;
          update();
          // NotificationService().showNotification(
          //     title: 'Done',
          //     body: '🚰 Water Pump Completed  Successfully',
          //     payLoad: 'item x');
        }
      });
      _ismanualwaterconfirm = true;
      update();
    }
  }

  void scheduleTask() {
    const Duration interval = Duration(seconds: 30);
    int repeatCount =
        pumptimer ~/ 30; // 5 minutes in seconds divided by 30 seconds interval

    int executionCount = 0;

    Timer.periodic(interval, (Timer timer) {
      if (executionCount < repeatCount) {
        getalldata();

        executionCount++;
      } else {
        timer.cancel();
      }
    });
  }

  //BACKGROUND SERVICES
}
