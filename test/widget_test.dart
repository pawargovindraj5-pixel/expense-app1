import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:expense_app/main.dart';

void main() {
  testWidgets('Expense screen displays expenses', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ExpensesScreen()));

    expect(find.text('Flutter ExpenseTracker'), findsOneWidget);
    expect(find.text('Flutter Course'), findsOneWidget);
    expect(find.text('Cinema'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
