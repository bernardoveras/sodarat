import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math show sin, pi;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sodarat/sodarat.dart';

import 'sodarat_spinner_interface.dart';

class _DelayTween extends Tween<double> {
  _DelayTween({double? begin, double? end, required this.delay}) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class SodaratDotSpinner extends HookWidget implements ISodaratSpinner {
  const SodaratDotSpinner({
    Key? key,
    this.color,
    this.size = 24.0,
    this.duration = const Duration(milliseconds: 1400),
  }) : super(key: key);

  final Color? color;
  final double size;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration)..repeat();

    return SizedBox.fromSize(
      size: Size(size * 2, size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (i) {
          return ScaleTransition(
            scale: _DelayTween(begin: 0.0, end: 1.0, delay: i * .2).animate(controller),
            child: SizedBox.fromSize(size: Size.square(size * 0.5), child: _itemBuilder(i)),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(int index) => DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? $adaptive_color.on_background_color(useContext()),
          shape: BoxShape.circle,
        ),
      );
}
