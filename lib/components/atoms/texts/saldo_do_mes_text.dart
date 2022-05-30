import 'package:flutter/material.dart';
import 'package:sodarat/sodarat.dart';

class SaldoDoMesText extends StatelessWidget {
  const SaldoDoMesText({
    Key? key,
    required this.value,
    this.visible = true,
  }) : super(key: key);
  final double value;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: $font_size_3,
          fontWeight: $font_weight_semi_bold,
          color: $adaptive_color.positive(),
        ),
        children: [
          const TextSpan(
            text: '+R\$ ',
          ),
          TextSpan(
            text: visible ? '${value.toString()} ' : 'XX,xx ',
          ),
          const TextSpan(
            text: 'este mês ',
          ),
        ],
      ),
    );
  }
}
