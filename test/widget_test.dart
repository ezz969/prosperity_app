// This is a basic Flutter widget test.
// If you want to add more tests, just copy the structure below!
//
// TIP: Use WidgetTester to interact with widgets, simulate taps, scrolls, etc.
// You can also check for text, icons, and widget properties.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:harari_prosperity_app/main.dart'; // Main app entry point

void main() {
  // This test checks if the counter increments when tapping the '+' icon
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProsperityApp());

    // Check that the counter starts at 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Simulate a tap on the '+' icon
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Counter should now show 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    // TODO: Add more widget tests for other screens
  });
}
