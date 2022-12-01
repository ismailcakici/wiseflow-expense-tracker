import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiseflow/product/widgets/animated_num/animated_num.dart';

import '../../../core/enums/padding/padding_enums.dart';
import '../../../core/theme/color_scheme/color_scheme.dart';
import '../../../feature/add_transaction/cubit/transaction_cubit.dart';
import '../../model/transaction/transaction_model.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;
  const TransactionList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        var cubit = context.read<TransactionCubit>();
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var transaction = list[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              background: Container(
                padding: EdgeInsets.all(AppPaddings.padding10.padding),
                alignment: Alignment.centerLeft,
                color: AppColorScheme.getInstance.solidRed,
                child: Icon(
                  Icons.delete,
                  color: AppColorScheme.getInstance.solidWhite,
                ),
              ),
              onDismissed: (direction) {
                cubit.deleteTransaction(list[index].id);
              },
              child: ListTile(
                leading: transaction.isExpense
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorScheme.getInstance.solidRed
                              .withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.arrow_downward,
                          color: AppColorScheme.getInstance.solidRed,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorScheme.getInstance.solidGreen
                              .withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.arrow_upward,
                          color: AppColorScheme.getInstance.solidGreen,
                        ),
                      ),
                title: Text(transaction.title),
                subtitle: Text(
                  DateFormat.yMMMMd(context.locale.languageCode)
                      .format(transaction.date),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedNum(
                      value: transaction.amount,
                      isLarge: false,
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () => cubit.deleteTransaction(list[index].id),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
