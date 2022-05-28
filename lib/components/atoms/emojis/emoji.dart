import 'package:flutter/material.dart';

import 'painters/happy_emoji_painter.dart';

class Emoji extends StatelessWidget {
  Emoji._(CustomPainter painter, double size) {
    _emoji = CustomPaint(
      size: Size(size, (size * 0.9696969696969697).toDouble()),
      painter: painter,
    );
  }

  factory Emoji.happy({double size = 32.0}) {
    return Emoji._(HappyEmojiPainter(), size);
  }

  late final Widget _emoji;

  @override
  Widget build(BuildContext context) => _emoji;
}
