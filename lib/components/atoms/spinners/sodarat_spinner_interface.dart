import 'package:flutter/material.dart';

abstract class ISodaratSpinner extends StatelessWidget {
  const ISodaratSpinner({
    super.key,
    this.size = 20.0,
  });

  Widget child(BuildContext context);
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: child(context),
      ),
    );
  }
}
