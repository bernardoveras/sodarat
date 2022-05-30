import 'package:flutter/material.dart';

import '../../../tokens/tokens.dart';

class SodaratTooltip extends StatelessWidget {
  const SodaratTooltip({
    Key? key,
    required this.message,
    this.preferBelow = true,
    required this.child,
  }) : super(key: key);

  final String? message;
  final bool preferBelow;
  final Widget child;

  String get _message => message == null || message == '' ? '' : message!;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _message,
      preferBelow: preferBelow,
      decoration: BoxDecoration(
        color: $adaptive_color.tooltip(context),
        borderRadius: $border_radius_4,
      ),
      textStyle: TextStyle(
        color: $adaptive_color.text_on_tooltip(context),
        fontSize: $font_size_1,
        fontWeight: $font_weight_medium,
        fontFamily: $font_family_inter,
      ),
      child: child,
    );
  }
}
