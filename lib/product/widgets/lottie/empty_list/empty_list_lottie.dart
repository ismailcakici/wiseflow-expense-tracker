import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListLottie extends StatelessWidget {
  const EmptyListLottie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/lottie/empty_list.json', height: 120, width: 120),
      ],
    );
  }
}
