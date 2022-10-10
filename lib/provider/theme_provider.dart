import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  ThemeData get theme => _themeData;
  void toggleTheme() {
    final isDark = _themeData == ThemeData.dark();
    if (isDark) {
      _themeData = ThemeData.light().copyWith(
        textTheme: GoogleFonts.interTextTheme(_themeData.textTheme),
        splashColor:  AppColors.primaryLight,
        hoverColor: AppColors.primaryLight,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: _themeData.iconTheme.copyWith(
          color: AppColors.primaryLight,
        ),
        primaryColor: AppColors.primaryLight,
        platform: TargetPlatform.iOS,
      );
    } else {
      _themeData = ThemeData.dark().copyWith(
        textTheme: GoogleFonts.interTextTheme(_themeData.textTheme),
      );
    }
    notifyListeners();
  }
}
