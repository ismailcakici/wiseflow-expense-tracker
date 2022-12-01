import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wiseflow/core/constants/shapes/app_shapes.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';

class AddTransactionButton extends StatelessWidget {
  final VoidCallback callback;
  const AddTransactionButton({Key? key, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.check),
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: AppShapes.getInstance.allRadius,
        ),
      ),
      label: const Text(LocaleKeys.add_transaction_add).tr(),
    );
  }
}
