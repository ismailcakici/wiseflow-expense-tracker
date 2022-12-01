import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiseflow/core/enums/padding/padding_enums.dart';
import 'package:wiseflow/feature/add_transaction/cubit/transaction_cubit.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';
import 'package:wiseflow/product/widgets/card/balance_card/balance_card.dart';
import 'package:wiseflow/core/components/text_tr/text_tr.dart';
import 'package:wiseflow/product/widgets/lottie/empty_list/empty_list_lottie.dart';
import 'package:wiseflow/product/widgets/transaction_list/transaction_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          var cubit = context.read<TransactionCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _balanceCard(cubit, state),
              ),
              Padding(
                padding: EdgeInsets.all(AppPaddings.padding10.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextTr(text: LocaleKeys.home_transactions_history),
                    Visibility(
                      visible: cubit.state.transactions.isEmpty ? false : true,
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                      Text(LocaleKeys.drawer_clear_cache.tr()),
                                  content:
                                      Text(LocaleKeys.drawer_clear_dialog.tr()),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(LocaleKeys.dialog_no)
                                            .tr()),
                                    TextButton(
                                        onPressed: () {
                                          cubit.clearCache();
                                          Navigator.pop(context);
                                        },
                                        child: const Text(LocaleKeys.dialog_yes)
                                            .tr()),
                                  ],
                                );
                              },
                            );
                          },
                          child:
                              const Text(LocaleKeys.drawer_clear_cache).tr()),
                    )
                  ],
                ),
              ),
              Flexible(
                child: cubit.state.transactions.isEmpty
                    ? const Center(child: EmptyListLottie())
                    : _transactions(cubit),
              ),
            ],
          );
        },
      ),
    );
  }

  BalanceCard _balanceCard(TransactionCubit cubit, TransactionState state) {
    return BalanceCard(
      totalBalance: cubit.getTotalBalance(state.transactions),
      income: cubit.getIncomes(state.transactions),
      expense: cubit.getExpense(state.transactions),
    );
  }

  TransactionList _transactions(TransactionCubit cubit) {
    return TransactionList(
      list: cubit.state.transactions,
    );
  }
}
