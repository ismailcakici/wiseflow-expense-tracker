import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AnimatedNum extends StatelessWidget {
  final num value;
  final bool isLarge;
  final Color color;
  const AnimatedNum(
      {Key? key,
      required this.value,
      required this.isLarge,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedFlipCounter(
      value: value,
      thousandSeparator: context.locale.languageCode == 'tr' ? '.' : ',',
      decimalSeparator: context.locale.languageCode == 'tr' ? ',' : '.',
      prefix: context.locale.languageCode == 'tr' ? '₺' : '\$',
      fractionDigits: 2,
      textStyle: isLarge
          ? Theme.of(context).textTheme.headline6!.copyWith(
                color: color,
              )
          : Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: color,
              ),
    );
  }
}
