// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_list/main.dart';

void main() {
  testWidgets('Counter Lists Tasks By Key', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    final todoTask = find.byKey(ValueKey(Status.todo.text));
    expect(todoTask, findsOneWidget);

    final ongoingTask = find.byKey(ValueKey(Status.ongoing.text));
    expect(ongoingTask, findsOneWidget);

    final doneTask = find.byKey(ValueKey(Status.done.text));
    expect(doneTask, findsOneWidget);
  });

  testWidgets('Find Tasks Containers By Key', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    final todoTasksNumber = find.byKey(const ValueKey('To Do-number: 4'));
    expect(todoTasksNumber, findsOneWidget);

    final ongoingTasksNumber = find.byKey(const ValueKey('On Going-number: 3'));
    expect(ongoingTasksNumber, findsOneWidget);

    final doneTasksNumber = find.byKey(const ValueKey('Done-number: 2'));
    expect(doneTasksNumber, findsOneWidget);
  });
}
