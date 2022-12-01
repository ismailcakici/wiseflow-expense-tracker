import 'package:flutter/material.dart';
import 'package:wiseflow/core/theme/color_scheme/color_scheme.dart';

class CardText extends StatelessWidget {
  final String text;
  final bool large;
  const CardText({Key? key, required this.text, required this.large})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: large
          ? Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColorScheme.getInstance.solidWhite,
              )
          : Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColorScheme.getInstance.solidWhite,
              ),
    );
  }
}
