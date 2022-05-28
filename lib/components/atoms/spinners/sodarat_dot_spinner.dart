import 'package:flutter/material.dart';
import 'package:sodarat/tokens/tokens.dart';

import 'sodarat_spinner_interface.dart';

class SodaratDotSpinner extends ISodaratSpinner {
  const SodaratDotSpinner({
    super.key,
    super.size,
  });

  @override
  Widget child(BuildContext context) {
    return Text('Dot');
  }
}
