import 'package:flutter/material.dart';
import 'package:sodarat/sodarat.dart';

class SodaratButton extends StatelessWidget {
  const SodaratButton({
    Key? key,
    this.text,
    this.child,
    required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.focusNode,
    this.onHover,
    this.onLongPress,
    this.height = 40,
    this.width,
    this.icon,
    this.tooltip = '',
    this.preferTooltipBelow = true,
    this.borderRadius,
  })  : assert(
          !(text is String && child is Widget) && !(text == null && child == null),
          'You should specify either a text or a child',
        ),
        super(key: key);

  final String? text;
  final String tooltip;
  final Widget? child;
  final Widget? icon;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final bool loading;
  final bool disabled;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final bool preferTooltipBelow;
  final BorderRadiusGeometry? borderRadius;

  bool get canPress => disabled == false && loading == false;
  bool get hasIcon => icon != null;

  Widget _buildChild() {
    if (loading == true) {
      return SodaratCircularSpinner(size: 16.0, color: $adaptive_color.on_primary());
    } else if (text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...{
            icon!,
            const SizedBox(width: $spacing_2),
          },
          Text(text!),
        ],
      );
    } else if (child != null) {
      return child!;
    } else {
      return const SizedBox();
    }
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled) || disabled) {
            return (backgroundColor ?? $primary_color).withOpacity(0.5);
          }
          if (states.contains(MaterialState.hovered)) {
            return $primary_color_hover;
          }

          return $adaptive_color.primary();
        },
      ),
      foregroundColor: MaterialStateProperty.all(foregroundColor ?? $adaptive_color.on_primary()),
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.all(
        textStyle ??
            const TextStyle(
              fontSize: $font_size_2,
              fontWeight: $font_weight_medium,
              fontFamily: $font_family_inter,
            ),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: hasIcon ? $spacing_4 : $spacing_6, vertical: $spacing_2),
      ),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius ?? $border_radius_default)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      preferBelow: preferTooltipBelow,
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
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: canPress ? onPressed : () {},
          style: _getButtonStyle(),
          onHover: onHover,
          onLongPress: onLongPress,
          focusNode: focusNode,
          child: _buildChild(),
        ),
      ),
    );
  }
}
