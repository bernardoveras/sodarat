import 'package:flutter/material.dart';
import 'package:sodarat/tokens/tokens.dart';

import 'sodarat_spinner_interface.dart';

class SodaratCircularSpinner extends StatelessWidget implements ISodaratSpinner {
  const SodaratCircularSpinner({
    super.key,
    this.strokeWidth = 2.0,
    this.size = 24.0,
  });

  final double strokeWidth;
  final double size;

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
