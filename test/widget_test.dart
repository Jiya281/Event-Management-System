import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_city/screens/profile.dart';

void main() {
  testWidgets('Profile Screen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

    // Verify that the ProfileScreen widget is rendered
    expect(find.byType(ProfileScreen), findsOneWidget);

    // Verify that the TextField widgets are displayed for entering profile information
    expect(find.byKey(Key('nameTextField')), findsOneWidget);
    expect(find.byKey(Key('dobTextField')), findsOneWidget);
    expect(find.byKey(Key('bioTextField')), findsOneWidget);

    // Tap on the Save button
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Verify that the profile information is updated
    // You may need to update these expect statements based on your actual UI
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Date of Birth'), findsOneWidget);
    expect(find.text('Bio'), findsOneWidget);
  });

  // Add more test cases as needed
}
