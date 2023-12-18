import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main.dart' as app_main;
import 'helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("All tests", () {
    setUpAll(() async {
      print("Setup all is run");
      app_main.main();
    });
    testWidgets("first test", (widgetTester) async {
      // This should get successful.
      await widgetTester.pumpAndSettle();
      print("First test is run");
    });
    testWidgets("second test", (widgetTester) async {
      // This should get successful.
      await widgetTester.pumpAndSettle();
      print("Second test is run");
    });
    testWidgets("third test", (widgetTester) async {
      // This will throw test error.
      await widgetTester.pumpAndSettle();
      print("Third test is starting");
      print("tapped button");

      await waitUntilVisible(widgetTester, find.byType(TextFormField));
      await widgetTester.pumpAndSettle();
      print("Third test is finished");
    }, timeout: const Timeout(Duration(seconds: 10)));

    testWidgets("last test", (widgetTester) async {
      // This should get successful. but its not
      await widgetTester.pumpAndSettle();
      print("last test is run");
    });
  });
}
