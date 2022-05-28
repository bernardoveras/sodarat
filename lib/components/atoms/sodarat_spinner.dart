import 'package:flutter/material.dart';
import 'package:sodarat/sodarat.dart';

class SodaratSpinner extends StatelessWidget {
  const SodaratSpinner({
    Key? key,
    this.size = 20.0,
    this.strokeWidth = 2.0,
  }) : super(key: key);

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: $adaptive_color.on_background_color(context),
        ),
      ),
    );
  }
}
