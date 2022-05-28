import 'dart:ui';

import 'package:flutter/material.dart';

import '../../atoms/spinners/spinners.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SpinnerOverlay extends StatelessWidget {
  const SpinnerOverlay({
    Key? key,
    this.spinnerColor,
    this.overlayColor,
    this.backgroundBlur = true,
    this.spinnerSize = 24.0,
  }) : super(key: key);

  final Color? overlayColor;
  final Color? spinnerColor;

  final double spinnerSize;

  final bool backgroundBlur;

  static void show(BuildContext context) {
    if (context.loaderOverlay.visible) return;

    context.loaderOverlay.show(widget: const SpinnerOverlay());
  }

  static void hide(BuildContext context) {
    if (!context.loaderOverlay.visible && context.loaderOverlay.overlayWidgetType != SpinnerOverlay) return;

    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: backgroundBlur ? 1.0 : 0.0, sigmaY: backgroundBlur ? 1.0 : 0.0),
      child: Container(
        color: Colors.white.withOpacity(0.8),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SodaratDotSpinner(
            color: spinnerColor,
            size: spinnerSize,
          ),
        ),
      ),
    );
  }
}
