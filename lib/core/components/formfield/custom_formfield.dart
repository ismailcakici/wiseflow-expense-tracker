import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wiseflow/product/init/localization/locale_keys.g.dart';

import '../../constants/shapes/app_shapes.dart';

class CustomFormfield extends StatefulWidget {
  final String text;
  final bool numKeyboard;
  final TextEditingController controller;
  const CustomFormfield({
    Key? key,
    required this.text,
    required this.controller,
    required this.numKeyboard,
  }) : super(key: key);

  @override
  State<CustomFormfield> createState() => _CustomFormfieldState();
}

class _CustomFormfieldState extends State<CustomFormfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return tr(LocaleKeys.add_transaction_validate);
        }
        return null;
      },
      maxLength: widget.numKeyboard ? 11 : null,
      inputFormatters: widget.numKeyboard
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      keyboardType:
          widget.numKeyboard ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        counterText: '',
        prefixText: widget.numKeyboard
            ? context.locale.languageCode == 'tr'
                ? '₺'
                : '\$'
            : null,
        label: Text(widget.text, style: Theme.of(context).textTheme.labelMedium)
            .tr(),
        border: OutlineInputBorder(
          borderRadius: AppShapes.getInstance.allRadius,
        ),
      ),
    );
  }
}
