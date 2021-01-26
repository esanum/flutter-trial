import 'package:flutter/material.dart';

enum MenuItem { red, green, blue }

const Map<MenuItem, String> tabName = {
  MenuItem.red: 'red',
  MenuItem.green: 'green',
  MenuItem.blue: 'blue',
};

const Map<MenuItem, MaterialColor> activeTabColor = {
  MenuItem.red: Colors.red,
  MenuItem.green: Colors.green,
  MenuItem.blue: Colors.blue,
};
