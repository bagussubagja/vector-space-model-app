import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  ThemeData get theme => _themeData;
  void toogleTheme() {
    final isDark = _themeData == ThemeData.dark();
    if (isDark) {
      _themeData = ThemeData.light();
    } else {
      _themeData = ThemeData.dark();
    }
    notifyListeners();
  }
}
