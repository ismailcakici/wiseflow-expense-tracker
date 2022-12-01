import 'package:flutter/material.dart';
import 'package:wiseflow/product/model/chart/chart_model.dart';
import 'package:wiseflow/product/model/transaction/transaction_model.dart';
import 'package:wiseflow/product/widgets/transaction_list/transaction_list.dart';

import '../../../../core/enums/padding/padding_enums.dart';
import '../../../../core/theme/color_scheme/color_scheme.dart';
import '../chart_with_container/chart_with_container.dart';

class GeneralChart extends StatelessWidget {
  final List<ChartData> chartData;
  final List<Transaction> transactionList;
  const GeneralChart(
      {Key? key, required this.transactionList, required this.chartData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppPaddings.padding10.padding),
          child: ChartWithContainer(
            chartData: chartData,
          ),
        ),
        Divider(
          color: AppColorScheme.getInstance.darkGreen,
          thickness: 1,
        ),
        Flexible(child: TransactionList(list: transactionList)),
      ],
    );
  }
}
