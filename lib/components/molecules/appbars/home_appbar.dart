import 'package:flutter/material.dart';
import 'package:sodarat/components/atoms/emojis/emoji.dart';

import '../../../tokens/tokens.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  Size get preferredSize => $size_home_app_bar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: $adaptive_color.background(context),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              text: 'Bem-vindo, ',
              style: TextStyle(
                color: $adaptive_color.text_primary(context),
                fontSize: $font_size_3,
                fontWeight: $font_weight_medium,
              ),
              children: [
                TextSpan(
                  text: username,
                  style: TextStyle(
                    color: $adaptive_color.text_primary(context),
                    fontSize: $font_size_3,
                    fontWeight: $font_weight_semi_bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: $spacing_2),
          Emoji.fiveHand(size: 20),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(
          height: 1.5,
          thickness: 1.5,
          color: $adaptive_color.stroke(context),
        ),
      ),
    );
  }
}
