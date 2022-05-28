import 'package:flutter/material.dart';
import 'package:sodarat/components/atoms/spinners/sodarat_circular_spinner.dart';
import 'package:sodarat/components/atoms/spinners/sodarat_dot_spinner.dart';
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

class HomePage extends StatelessWidget {
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
          children: const <Widget>[
            SodaratCircularSpinner(),
            SodaratDotSpinner(),
          ],
        ),
      ),
    );
  }
}
