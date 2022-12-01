import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';

mixin ReportConstants {
  final List<Tab> tabs = [
    Tab(
      text: LocaleKeys.report_daily.tr(),
    ),
    Tab(
      text: LocaleKeys.report_weekly.tr(),
    ),
    Tab(
      text: LocaleKeys.report_monthly.tr(),
    )
  ];
}
