import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wiseflow/core/constants/shapes/app_shapes.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';

import '../../../../feature/add_transaction/cubit/transaction_cubit.dart';
import '../../../model/transaction/transaction_model.dart';
import 'add_transaction_button.dart';

class AddTransactionButtonWidget extends StatelessWidget {
  const AddTransactionButtonWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController amountController,
    required this.selectedDate,
    required this.isExpense,
  })  : _formKey = formKey,
        _titleController = titleController,
        _amountController = amountController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleController;
  final TextEditingController _amountController;
  final DateTime? selectedDate;
  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return AddTransactionButton(callback: () {
      if (_formKey.currentState!.validate()) {
        String uuid = const Uuid().v1();
        var transaction = Transaction(
          id: uuid,
          title: _titleController.text,
          amount: num.parse(_amountController.text),
          date: selectedDate!,
          isExpense: isExpense,
        );
        context.read<TransactionCubit>().addTransaction(transaction, uuid);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Wrap(
              children: [
                Text(
                  transaction.title,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  LocaleKeys.add_transaction_dialog,
                  overflow: TextOverflow.clip,
                ).tr(),
              ],
            ),
            action: SnackBarAction(
                label: LocaleKeys.add_transaction_dialog_cancel.tr(),
                onPressed: () {
                  context
                      .read<TransactionCubit>()
                      .deleteTransaction(transaction.id);
                }),
            behavior: SnackBarBehavior.floating,
            shape: AppShapes.getInstance.allRoundedShape,
          ),
        );
        _titleController.clear();
        _amountController.clear();
      }
    });
  }
}
