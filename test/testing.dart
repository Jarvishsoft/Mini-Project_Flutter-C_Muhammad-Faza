import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI Testing Main Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());

    // Mem-verifikasi apakah widget ditampilkan dengan benar
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Untuk mem-verifikasi tombol login
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Memverifikasipada widget page Login Screen
    expect(find.text('Login Screen'), findsOneWidget);

    //  Menekan tombol "Daftar" untuk navigasi ke layar registrasi
    await tester.tap(find.text('Daftar'));
    await tester.pumpAndSettle();
  });
}
