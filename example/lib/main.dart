import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sodarat/sodarat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sodarat Design System',
      theme: ThemeData(
        colorSchemeSeed: $primary_color,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoaderOverlay(
        useDefaultLoading: false,
        disableBackButton: true,
        overlayColor: Colors.transparent,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<void> abrirLoading() async {
    //   SpinnerOverlay.show(context);

    //   return Future.delayed(const Duration(seconds: 2))..whenComplete(() => SpinnerOverlay.hide(context));
    // }

    final saldoDoMesIsVisible = useValueNotifier(true);

    return Scaffold(
      appBar: const HomeAppBar(username: 'Bernardo Veras'),
      backgroundColor: $adaptive_color.background(context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Components(
              title: 'Spinner',
              components: [
                SodaratTooltip(
                  message: 'Circular Spinner',
                  child: SodaratCircularSpinner(),
                ),
                SodaratTooltip(
                  message: 'Dot Spinner',
                  child: SodaratDotSpinner(),
                ),
              ],
            ),
            const SizedBox(height: $spacing_5),
            Components(
              title: 'Result Icon',
              components: [
                SodaratTooltip(
                  message: 'Error',
                  child: ResultIcon.error(),
                ),
                SodaratTooltip(
                  message: 'Success',
                  child: ResultIcon.success(),
                ),
              ],
            ),
            // const SizedBox(height: $spacing_5),
            // ElevatedButton(
            //   child: const Text('Abrir loading'),
            //   onPressed: () {
            //     abrirLoading();
            //   },
            // ),
            const SizedBox(height: $spacing_5),
            Components(
              title: 'Emoji',
              components: [
                SodaratTooltip(
                  message: 'Happy',
                  child: Emoji.happy(),
                ),
                SodaratTooltip(
                  message: 'Sad',
                  child: Emoji.sad(),
                ),
                SodaratTooltip(
                  message: 'Party',
                  child: Emoji.party(),
                ),
                SodaratTooltip(
                  message: 'Spy',
                  child: Emoji.spy(),
                ),
              ],
            ),
            const SizedBox(height: $spacing_5),
            Components(
              title: 'Botão',
              components: [
                SodaratButton(
                  text: 'Label',
                  onPressed: () {},
                  tooltip: 'Default',
                ),
                SodaratButton(
                  text: 'Label',
                  loading: true,
                  onPressed: () {},
                  tooltip: 'Loading',
                ),
                const SodaratButton(
                  text: 'Label',
                  onPressed: null,
                  tooltip: 'Disabled',
                ),
              ],
            ),
            const SizedBox(height: $spacing_5),
            Components(
              title: 'Botão com icone',
              components: [
                SodaratButton(
                  text: 'Label',
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  tooltip: 'Default',
                ),
                const SodaratButton(
                  text: 'Label',
                  onPressed: null,
                  icon: Icon(Icons.add),
                  tooltip: 'Disabled',
                ),
              ],
            ),
            const SizedBox(height: $spacing_5),
            AnimatedBuilder(
                animation: saldoDoMesIsVisible,
                builder: (context, child) {
                  return Components(
                    title: 'Textos',
                    components: [
                      CheckboxListTile(
                        value: saldoDoMesIsVisible.value,
                        onChanged: (v) {
                          saldoDoMesIsVisible.value = v ?? true;
                        },
                        title: const Text('Visibilidade do saldo do mês'),
                        contentPadding: EdgeInsets.zero,
                      ),
                      SodaratTooltip(
                        message: 'Saldo do mês',
                        child: SaldoDoMesText(
                          value: 46.57,
                          visible: saldoDoMesIsVisible.value,
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Components extends StatelessWidget {
  const Components({
    Key? key,
    required this.title,
    required this.components,
  }) : super(key: key);

  final String title;
  final List<Widget> components;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: $font_size_3,
            fontWeight: $font_weight_bold,
            fontFamily: $font_family_inter,
            color: $adaptive_color.on_background_color(context),
          ),
        ),
        const SizedBox(height: $spacing_4),
        Wrap(
          spacing: $spacing_4,
          runSpacing: $spacing_4,
          children: components,
        ),
      ],
    );
  }
}
