import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wiseflow/core/components/text_tr/text_tr.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';
import 'package:wiseflow/product/model/chart/chart_model.dart';

import '../../../../core/constants/shapes/app_shapes.dart';
import '../../../../core/theme/color_scheme/color_scheme.dart';

class ChartWithContainer extends StatelessWidget {
  final List<ChartData> chartData;
  const ChartWithContainer({Key? key, required this.chartData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 2.5,
      width: width,
      decoration: BoxDecoration(
        borderRadius: AppShapes.getInstance.allRadius,
        border: Border.all(
          width: 3.0,
          color: AppColorScheme.getInstance.darkGreen,
        ),
      ),
      child: chartData.isEmpty
          ? const Center(
              child: TextTr(
                text: LocaleKeys.report_empty_chart,
              ),
            )
          : SfCircularChart(
              legend: Legend(
                alignment: ChartAlignment.center,
                position: LegendPosition.bottom,
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                isResponsive: true,
              ),
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.name,
                  yValueMapper: (ChartData data, _) => data.amount,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                  ),
                  dataLabelMapper: (datum, index) =>
                      NumberFormat.simpleCurrency(
                              locale: context.locale.languageCode)
                          .format(datum.amount),
                ),
              ],
            ),
    );
  }
}
