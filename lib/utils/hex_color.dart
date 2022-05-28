import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
