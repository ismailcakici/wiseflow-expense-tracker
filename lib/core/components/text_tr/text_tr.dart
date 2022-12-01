import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextTr extends StatelessWidget {
  final String text;
  const TextTr({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    ).tr();
  }
}
