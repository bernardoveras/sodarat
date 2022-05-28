import 'package:flutter/material.dart';
import 'package:sodarat/sodarat.dart';

const kResultIconSize = 80.0;
const kResultIconStrokeWidth = 2.5;

class ResultIcon extends StatelessWidget {
  ResultIcon._create({
    this.child,
    this.icon,
    super.key,
    double? size,
    this.strokeWidth = kResultIconStrokeWidth,
    this.color,
  }) : assert(
          !(child is Widget && icon is IconData) && !(child == null && icon == null),
          'You should specify either a icon or a child',
        ) {
    _size = size ?? kResultIconSize;
  }

  factory ResultIcon.success({
    Key? key,
    double? size,
    double strokeWidth = kResultIconStrokeWidth,
  }) =>
      ResultIcon._create(
        key: key,
        color: $positive_color,
        size: size,
        icon: Icons.check_rounded,
      );

  factory ResultIcon.error({
    Key? key,
    double? size,
    double strokeWidth = kResultIconStrokeWidth,
  }) =>
      ResultIcon._create(
        key: key,
        color: $negative_color,
        size: size,
        icon: Icons.close_rounded,
        strokeWidth: strokeWidth,
      );

  final Widget? child;
  final IconData? icon;
  final Color? color;
  final double strokeWidth;
  late final double _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      width: _size,
      decoration: BoxDecoration(
        border: Border.all(
          color: color ?? $adaptive_color.on_background_color(context),
          width: strokeWidth,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color ?? $adaptive_color.on_background_color(context),
        size: _size * 0.6,
      ),
    );
  }
}
