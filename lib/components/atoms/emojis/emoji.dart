import 'package:flutter/material.dart';

import 'painters/painters.dart';

class Emoji extends StatelessWidget {
  Emoji._(CustomPainter painter, double size) {
    _emoji = CustomPaint(
      size: Size(size, (size * 0.9696969696969697).toDouble()),
      painter: painter,
    );
  }

  factory Emoji.happy({double size = 32.0}) => Emoji._(HappyEmojiPainter(), size);
  factory Emoji.sad({double size = 32.0}) => Emoji._(SadEmojiPainter(), size);
  factory Emoji.spy({double size = 32.0}) => Emoji._(SpyEmojiPainter(), size);
  factory Emoji.party({double size = 32.0}) => Emoji._(PartyEmojiPainter(), size);
  factory Emoji.fiveHand({double size = 32.0}) => Emoji._(FiveHandEmojiPainter(), size);

  late final Widget _emoji;

  @override
  Widget build(BuildContext context) => _emoji;
}
