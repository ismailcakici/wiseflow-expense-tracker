import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/shapes/app_shapes.dart';
import '../../../core/enums/padding/padding_enums.dart';
import '../../../core/theme/color_scheme/color_scheme.dart';
import '../../../product/constants/report/report_constants.dart';
import '../../../product/widgets/charts/general_chart/general_chart.dart';
import '../../add_transaction/cubit/transaction_cubit.dart';

part '../view/report_view.dart';

abstract class ReportViewModel extends State<ReportView>
    with ReportConstants, SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }
}
