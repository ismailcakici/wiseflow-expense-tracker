import 'package:flutter/material.dart';
import 'package:wiseflow/core/theme/app_theme/i_app_theme.dart';
import 'package:wiseflow/core/theme/color_scheme/i_color_scheme.dart';

class AppTheme extends IAppTheme with IColorScheme {
  @override
  ThemeData get appTheme => ThemeData(
        fontFamily: 'Poppins',
        colorScheme: _colorScheme,
        appBarTheme: _appBarTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
      );

  BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: appColorScheme!.lightGreen,
        showUnselectedLabels: false,
        selectedItemColor: appColorScheme!.solidWhite,
        unselectedItemColor: appColorScheme!.solidGray,
        type: BottomNavigationBarType.fixed,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        systemOverlayStyle: appColorScheme!.systemUiOverlayLight,
        centerTitle: true,
      );

  ColorScheme get _colorScheme => ColorScheme(
        brightness: appColorScheme!.brightnessLight,
        primary: appColorScheme!.lightGreen,
        onPrimary: appColorScheme!.solidWhite,
        secondary: appColorScheme!.darkGreen,
        onSecondary: appColorScheme!.solidWhite,
        error: appColorScheme!.solidRed,
        onError: appColorScheme!.solidWhite,
        background: appColorScheme!.solidWhite,
        onBackground: appColorScheme!.solidBlack,
        surface: appColorScheme!.solidWhite,
        onSurface: appColorScheme!.solidBlack,
      );

  static final AppTheme _instance = AppTheme._init();
  AppTheme._init();
  static AppTheme get getInstance => _instance;
}
