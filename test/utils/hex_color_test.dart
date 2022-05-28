import 'package:flutter_test/flutter_test.dart';
import 'package:sodarat/utils/hex_color.dart';

void main() {
  test('Convert hex string to Color', () async {
    String hexColorString = '#3466ff';

    expect(HexColor(hexColorString).value, 0xFF3466FF);
  });
}
