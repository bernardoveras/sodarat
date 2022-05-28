import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sodarat/components/molecules/overlays/spinner_overlay.dart';
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
      home: const LoaderOverlay(
        useDefaultLoading: false,
        disableBackButton: true,
        overlayWidget: SpinnerOverlay(),
        overlayColor: Colors.transparent,
        child: HomePage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> abrirLoading() async {
      SpinnerOverlay.show(context);

      return Future.delayed(const Duration(seconds: 2))..whenComplete(() => SpinnerOverlay.hide(context));
    }

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
            const SodaratCircularSpinner(),
            const SizedBox(height: $spacing_4),
            const SodaratDotSpinner(),
            const SizedBox(height: $spacing_4),
            ElevatedButton(
              child: const Text('Abrir loading'),
              onPressed: () {
                abrirLoading();
              },
            ),
          ],
        ),
      ),
    );
  }
}
