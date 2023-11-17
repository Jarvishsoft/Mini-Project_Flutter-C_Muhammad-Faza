import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hikeabis_app/ui/screens/sop.dart';
import 'package:hikeabis_app/ui/screens/panduan_page.dart';

void main() {
  testWidgets('SOP Widget Test', (WidgetTester tester) async {
    // Build aplikasi dan men-trigger frame
    await tester.pumpWidget(const MaterialApp(
      home: SOP(),
    ));

    // Verifikasi widget pada page SOP
    expect(find.text('SOP (Standar Operasional Prosedur) Pendakian Gunung'),
        findsOneWidget);
    expect(find.byType(Divider), findsNWidgets(2));
    expect(find.text('Setuju & Kembali'), findsOneWidget);

    // Button 'Setuju & Kembali' dan verifikasi navigasi
    await tester.tap(find.text('Setuju & Kembali'));
    await tester.pumpAndSettle();
  });

  testWidgets('PanduanBooking Widget Test', (WidgetTester tester) async {
    // Build aplikasi dan men-trigger frame
    await tester.pumpWidget(const MaterialApp(
      home: PanduanBooking(),
    ));

    expect(find.text('PANDUAN BOOKING ONLINE MOBILE PENDAKIAN GUNUNG'),
        findsOneWidget);
    expect(find.byType(Divider), findsNWidgets(2));
    expect(find.text('Setuju & Kembali'), findsOneWidget);

    await tester.tap(find.text('Setuju & Kembali'));
    await tester.pumpAndSettle();
  });
}
