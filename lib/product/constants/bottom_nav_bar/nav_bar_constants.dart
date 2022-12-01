import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wiseflow/feature/home/view/home_view.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';

import '../../../feature/add_transaction/viewmodel/add_transaction_viewmodel.dart';
import '../../../feature/report/viewmodel/report_viewmodel.dart';

mixin BottomNavBarConstants {
  List<Widget> pages = [
    const HomeView(),
    const AddTransactionView(),
    const ReportView(),
  ];

  List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
      label: LocaleKeys.controller_home.tr(),
      icon: const Icon(Icons.home),
    ),
    BottomNavigationBarItem(
        icon: const Icon(Icons.add),
        label: LocaleKeys.controller_add_transactions.tr()),
    BottomNavigationBarItem(
      icon: const Icon(Icons.pie_chart),
      label: LocaleKeys.controller_reports.tr(),
    ),
  ];
}
