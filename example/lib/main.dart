import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sodarat/sodarat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: $primary_color,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $adaptive_color.background(context),
      appBar: AppBar(
        title: const Text('Sodarat'),
        backgroundColor: $adaptive_color.primary(),
        foregroundColor: $adaptive_color.on_primary(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: $adaptive_color.negative_container(),
                borderRadius: $border_radius_default,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: $spacing_4,
                vertical: $spacing_2,
              ),
              child: Text(
                'Bloqueado',
                style: TextStyle(
                  fontSize: $font_size_3,
                  color: $adaptive_color.on_negative_container(),
                  fontWeight: $font_weight_medium,
                ),
              ),
            ),
            const SizedBox(height: $spacing_4),
            Container(
              decoration: BoxDecoration(
                color: $adaptive_color.positive_container(),
                borderRadius: $border_radius_default,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: $spacing_4,
                vertical: $spacing_2,
              ),
              child: Text(
                'Ativo',
                style: TextStyle(
                  fontSize: $font_size_3,
                  color: $adaptive_color.on_positive_container(),
                  fontWeight: $font_weight_medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
