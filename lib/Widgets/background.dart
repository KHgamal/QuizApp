import 'package:flutter/material.dart';
class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key, required this.endColor, required this.beginColor}) : super(key: key);
 final Color endColor;
  final Color beginColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            colors: [
              endColor,
              beginColor,
            ],
          ),
        ),
      );

  }
}
