import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  print('Starting test driver');

  try {
    var driver = await integrationDriver(
      onScreenshot: (
        String screenshotName,
        List<int> screenshotBytes, [
        Map<String, Object?>? metadata,
      ]) async {
        final File image = await File('screenshots/$screenshotName.png')
            .create(recursive: true);
        image.writeAsBytesSync(screenshotBytes);
        return true;
      },
    );
  } catch (err) {
    print('Error occurred $err');
  }
}
