import 'package:flutter/material.dart';
import 'package:wiseflow/core/constants/shapes/app_shapes.dart';

class CalendarButton extends StatelessWidget {
  final VoidCallback callback;
  const CalendarButton({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: AppShapes.getInstance.allRadius,
        ),
      ),
      onPressed: callback,
      child: const Icon(Icons.calendar_month),
    );
  }
}
