import 'package:flutter/material.dart';
import 'package:sodarat/tokens/tokens.dart';

import 'sodarat_spinner_interface.dart';

class SodaratCircularSpinner extends ISodaratSpinner {
  const SodaratCircularSpinner({
    super.key,
    super.size,
    this.strokeWidth = 2.0,
  });

  final double strokeWidth;
  
  @override
  Widget child(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      color: $adaptive_color.on_background_color(context),
    );
  }
}
