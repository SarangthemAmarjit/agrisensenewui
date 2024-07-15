import 'package:flutter/material.dart';

enum VisualType { fiveMins, tenMins, fifteenMins }

List<String> dropdownItems = [
  'Soil Humidity',
  'Soil Temperature',
  'Soil pH Level',
  'Soil NPK'
];

List<String> timeintervallist = [
  '5 min',
  '15 min',
  '30 min',
];
//DARK THEME COLORS
const cardBackgroundColor = Color(0xFF21222D);
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xFF15131C);
var selectionColor = Colors.teal[100];

//LIGHT THEME COLOR
const lightcardBackgroundColor = Color.fromARGB(255, 255, 253, 253);
const lightbackgroundColor = Color.fromARGB(255, 236, 247, 233);

const defaultPadding = 20.0;
