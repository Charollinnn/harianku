import 'package:flutter_test/flutter_test.dart';
import 'package:harianku/main.dart';

void main() {
  testWidgets('Splash Screen pindah ke halaman Login', (tester) async {
    await tester.pumpWidget(const HarianApp());

    // Splash Screen tampil
    expect(find.text('Harianku'), findsOneWidget);

    // Tunggu timer lima detik, lalu pindah halaman
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    // Halaman Login tampil
    expect(find.text('Masuk untuk melanjutkan'), findsOneWidget);
  });
}