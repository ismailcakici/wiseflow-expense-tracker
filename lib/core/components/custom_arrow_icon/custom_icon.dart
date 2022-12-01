import 'package:flutter/material.dart';
import 'package:wiseflow/core/theme/color_scheme/color_scheme.dart';

class CustomIcon extends StatelessWidget {
  final bool up;
  const CustomIcon({Key? key, required this.up}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColorScheme.getInstance.solidWhite.withOpacity(0.1),
          ),
          width: 30,
          height: 30,
          child: up
              ? const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
        ),
      ],
    );
  }
}
