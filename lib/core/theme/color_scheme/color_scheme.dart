import 'package:flutter/services.dart';

class AppColorScheme {
  final Brightness brightnessLight = Brightness.light;
  final SystemUiOverlayStyle systemUiOverlayLight = SystemUiOverlayStyle.light;

  final Color lightGreen = const Color(0xff3d918b);
  final Color darkGreen = const Color(0xff2f7e79);
  final Color solidWhite = const Color(0xffffffff);
  final Color solidBlack = const Color(0xff222222);
  final Color solidGray = const Color(0xffaaaaaa);
  final Color solidGreen = const Color(0xff25a969);
  final Color solidRed = const Color(0xffd02121);

  static final AppColorScheme _instance = AppColorScheme._init();
  AppColorScheme._init();

  static AppColorScheme get getInstance => _instance;
}
