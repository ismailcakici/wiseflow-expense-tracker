part of '../viewmodel/report_viewmodel.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends ReportViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppPaddings.padding10.padding),
            child: _tabs(),
          ),
          Expanded(
            child: BlocBuilder<TransactionCubit, TransactionState>(
              builder: (context, state) {
                var cubit = context.read<TransactionCubit>();
                return TabBarView(
                  controller: tabController,
                  children: [
                    _dailyChart(cubit),
                    _weeklyChart(cubit),
                    _monthlyChart(cubit),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  GeneralChart _monthlyChart(TransactionCubit cubit) {
    return GeneralChart(
        chartData: cubit.getMonthlySections(),
        transactionList: cubit.getMonthlyExpenses());
  }

  GeneralChart _weeklyChart(TransactionCubit cubit) {
    return GeneralChart(
      chartData: cubit.getWeeklySections(),
      transactionList: cubit.getWeeklyExpenses(),
    );
  }

  GeneralChart _dailyChart(TransactionCubit cubit) {
    return GeneralChart(
      chartData: cubit.getDailySections(),
      transactionList: cubit.getDailyExpenses(),
    );
  }

  TabBar _tabs() {
    return TabBar(
      tabs: tabs,
      controller: tabController,
      indicator: BoxDecoration(
        borderRadius: AppShapes.getInstance.allRadius,
        gradient: LinearGradient(
          colors: [
            AppColorScheme.getInstance.darkGreen,
            AppColorScheme.getInstance.lightGreen,
          ],
        ),
      ),
      unselectedLabelColor: AppColorScheme.getInstance.solidBlack,
    );
  }
}
