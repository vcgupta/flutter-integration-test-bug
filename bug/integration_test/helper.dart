import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

Future<void> waitUntilVisible(WidgetTester tester, Finder finder,
    {Duration timeout = const Duration(seconds: 150)}) async {
  bool timerDone = false;
  final timer = Timer(
      timeout,
      () => throw TimeoutException(
          "Even after waiting for $timeout time, the widget is not visible."));
  while (timerDone != true) {
    await tester.runAsync(() async {
      await tester.pump();
      final found = tester.any(finder);
      if (found) {
        timerDone = true;
      }
    });
  }
  timer.cancel();
}
