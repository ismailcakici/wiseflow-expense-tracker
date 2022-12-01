import 'package:flutter/material.dart';
import 'package:wiseflow/core/enums/radius/radius_enums.dart';

class AppShapes {
  final ShapeBorder allRoundedShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.radius50.radius),
  );

  final ShapeBorder topBottomRightShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(AppRadius.radius60.radius),
      bottomRight: Radius.circular(AppRadius.radius60.radius),
    ),
  );

  final ShapeBorder leftRightBottomShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(AppRadius.radius40.radius),
      bottomRight: Radius.circular(AppRadius.radius40.radius),
    ),
  );

  final BorderRadius leftRightTopRadius = BorderRadius.only(
    topLeft: Radius.circular(AppRadius.radius40.radius),
    topRight: Radius.circular(AppRadius.radius40.radius),
  );

  final BorderRadius allRadius =
      BorderRadius.circular(AppRadius.radius50.radius);

  static final AppShapes _instance = AppShapes._init();
  AppShapes._init();
  static AppShapes get getInstance => _instance;
}
