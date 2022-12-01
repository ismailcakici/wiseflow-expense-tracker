import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wiseflow/core/constants/shapes/app_shapes.dart';
import 'package:wiseflow/core/theme/color_scheme/color_scheme.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';
import 'package:wiseflow/product/widgets/animated_num/animated_num.dart';
import 'package:wiseflow/product/widgets/card/card_text/card_text.dart';
import 'package:wiseflow/core/components/custom_arrow_icon/custom_icon.dart';

class BalanceCard extends StatelessWidget {
  final num totalBalance;
  final num income;
  final num expense;
  const BalanceCard({
    Key? key,
    required this.totalBalance,
    required this.income,
    required this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: AppShapes.getInstance.allRoundedShape,
      color: AppColorScheme.getInstance.darkGreen,
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: AppShapes.getInstance.allRadius,
          gradient: LinearGradient(
            colors: [
              AppColorScheme.getInstance.lightGreen,
              AppColorScheme.getInstance.darkGreen,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    _totalBalanceRow(),
                    _totalAmountRow(context),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                _incomeColumn(context),
                _expenseColumn(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _totalAmountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedNum(
          color: Colors.white,
          value: totalBalance,
          isLarge: true,
        ),
      ],
    );
  }

  Column _expenseColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CardText(text: LocaleKeys.home_expense.tr(), large: false),
            const SizedBox(
              width: 4,
            ),
            const CustomIcon(up: false),
          ],
        ),
        AnimatedNum(
          value: expense,
          isLarge: true,
          color: Colors.white,
        )
      ],
    );
  }

  Column _incomeColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CardText(text: LocaleKeys.home_income.tr(), large: false),
            const SizedBox(
              width: 4,
            ),
            const CustomIcon(up: true),
          ],
        ),
        AnimatedNum(
          color: Colors.white,
          value: income,
          isLarge: true,
        )
      ],
    );
  }

  Row _totalBalanceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardText(text: LocaleKeys.home_total_balance.tr(), large: false),
        const SizedBox(
          width: 4,
        ),
        const CustomIcon(up: true),
      ],
    );
  }
}
