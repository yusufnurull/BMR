// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:bmi/calculator.dart';
import 'package:bmi/main.dart';

void main() {
  test('Mifflin-St Jeor calculation uses the correct gender constant', () {
    final maleCalculator = BmrCalculator(
      height: 160,
      weight: 60,
      age: 20,
      gender: Gender.male,
    );
    final femaleCalculator = BmrCalculator(
      height: 160,
      weight: 60,
      age: 20,
      gender: Gender.female,
    );

    expect(maleCalculator.calculateBMR(), 1505);
    expect(femaleCalculator.calculateBMR(), 1339);
  });

  testWidgets('BMR screen renders with default values', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('BMR CALCULATOR'), findsOneWidget);
    expect(find.text('WEIGHT (kg)'), findsOneWidget);
    expect(find.text('60'), findsOneWidget);
    expect(find.text('AGE (years)'), findsOneWidget);
    expect(find.text('20'), findsOneWidget);
    expect(find.text('MALE'), findsOneWidget);
  });

  testWidgets('calculate button opens the BMR result page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.ensureVisible(find.text('CALCULATE'));
    await tester.tap(find.text('CALCULATE'));
    await tester.pumpAndSettle();

    // 60 kg, 160 cm, 20 tahun, laki-laki menghasilkan sekitar 1505 kcal/hari.
    expect(find.text('Your BMR'), findsOneWidget);
    expect(find.text('1505'), findsOneWidget);
    expect(find.text('kcal/day'), findsOneWidget);
  });
}
