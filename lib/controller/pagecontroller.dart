import 'package:get/get.dart';

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

  bool _islightmode = false;
  bool get islightmode => _islightmode;

  void resetpageindex() {
    _isdashboard = true;

    _issettiing = false;

    _issignout = false;
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
        _isdashboard = true;
        _issignout = false;
        update();
        break;
      case 2:
        _issignout = true;
        _isdashboard = true;
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
}
