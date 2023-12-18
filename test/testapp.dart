import 'package:flutter/material.dart';
import 'package:flutter_learn/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("TESTING APP FOR FIRST TIME", (WidgetTester tester) async {
    await tester.pumpWidget(const appHome());

    expect(find.byType(Container), findsOneWidget);
  });
}
