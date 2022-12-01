import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wiseflow/core/enums/padding/padding_enums.dart';
import 'package:wiseflow/core/enums/radius/radius_enums.dart';
import 'package:wiseflow/product/constants/bottom_nav_bar/nav_bar_constants.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';
import 'package:wiseflow/product/init/localization/localizaton_manager.dart';

import '../../../core/constants/app/app_constants.dart';

part '../view/tab_controller_view.dart';

abstract class TabControllerViewModel extends State<TabControllerView>
    with BottomNavBarConstants {
  int currentIndex = 0;
}
