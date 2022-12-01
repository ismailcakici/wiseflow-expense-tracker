part of '../viewmodel/add_transaction_viewmodel.dart';

class AddTransactionView extends StatefulWidget {
  const AddTransactionView({Key? key}) : super(key: key);

  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends AddTransactionViewModel {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _addTransactionText(),
                _titleFormField(),
                _amountFormField(),
                _radioExpense(),
                _radioIncome(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AddTransactionButtonWidget(
                      formKey: _formKey,
                      titleController: _titleController,
                      amountController: _amountController,
                      selectedDate: selectedDate,
                      isExpense: isExpense,
                    ),
                    Column(
                      children: [
                        CalendarButton(callback: () async {
                          selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate:
                                DateTime.now().add(const Duration(days: 700)),
                          );
                          setState(() {
                            selectedDate;
                          });
                        }),
                        Text(DateFormat.yMMMMd(context.locale.languageCode)
                            .format(selectedDate ?? DateTime.now())),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _amountFormField() {
    return Padding(
      padding: EdgeInsets.all(AppPaddings.padding15.padding),
      child: CustomFormfield(
          text: LocaleKeys.add_transaction_amount,
          controller: _amountController,
          numKeyboard: true),
    );
  }

  Padding _addTransactionText() {
    return Padding(
      padding: EdgeInsets.all(AppPaddings.padding20.padding),
      child: const TextTr(text: LocaleKeys.add_transaction_add),
    );
  }

  RadioListTile<bool> _radioIncome() {
    return RadioListTile(
        activeColor: AppColorScheme.getInstance.lightGreen,
        title: const Text(LocaleKeys.add_transaction_income).tr(),
        value: false,
        groupValue: isExpense,
        onChanged: (value) {
          setState(() {
            isExpense = value!;
          });
        });
  }

  RadioListTile<bool> _radioExpense() {
    return RadioListTile(
        activeColor: AppColorScheme.getInstance.lightGreen,
        title: const Text(LocaleKeys.add_transaction_expense).tr(),
        value: true,
        groupValue: isExpense,
        onChanged: (value) {
          setState(() {
            isExpense = value!;
          });
        });
  }

  Padding _titleFormField() {
    return Padding(
      padding: EdgeInsets.all(AppPaddings.padding15.padding),
      child: CustomFormfield(
        numKeyboard: false,
        text: LocaleKeys.add_transaction_title,
        controller: _titleController,
      ),
    );
  }
}
