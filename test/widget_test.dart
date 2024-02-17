import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

void main() {
  testWidgets('Start interview button test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MockInterviewScreen()));

    //Verify that the Start Interview button is present
    expect(find.text('Start Interview'), findsOneWidget);

    //Start Interview button check
    await tester.tap(find.text('Start Interview'));
    await tester.pump();

    //Verify that the question dialog is shown after tapping the Start Interview button
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('Question dialog test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MockInterviewScreen()));

    //Start Interview button check
    await tester.tap(find.text('Start Interview'));
    await tester.pump();

    //Verify that the question dialog shows the first question
    expect(find.text('Question 1'), findsOneWidget);
    expect(find.text('Tell me about yourself.'), findsOneWidget);

    //Tap on the Next button in the question dialog
    await tester.tap(find.text('Next'));
    await tester.pump();

    //Check that the next question is shown in the dialog
    expect(find.text('Question 2'), findsOneWidget);
  });

  testWidgets('Interview end dialog test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MockInterviewScreen()));

    //Start Interview button check
    await tester.tap(find.text('Start Interview'));
    await tester.pump();

    //Answer all questions
    for (int i = 0; i < 15; i++) {
      await tester.tap(find.text('Next'));
      await tester.pump();
    }

    // Verify that the interview end dialog is shown after answering all questions
    expect(find.text('Interview Over'), findsOneWidget);
    expect(find.text('You have answered all questions.'), findsOneWidget);
  });
}
