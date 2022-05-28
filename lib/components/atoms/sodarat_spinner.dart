import 'package:flutter/material.dart';

class SodaratSpinner extends StatelessWidget {
  const SodaratSpinner({
    Key? key,
    this.size = 50,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
