// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// https://flutter.dev/docs/testing/integration-tests
// https://flutter.dev/docs/cookbook/testing/integration/introduction

void main() {
  _testFirst();
  //_testSecond(); // Some tests failed.
}

void _testSecond() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });

    test('increments the counter during animation', () async {
      await driver.runUnsynchronized(() async {
        // First, tap the button.
        await driver.tap(buttonFinder);

        // Then, verify the counter text is incremented by 1.
        expect(await driver.getText(counterTextFinder), "1");
      });
    });
  });
}

void _testFirst() {
  group('end-to-end test', () {
    FlutterDriver driver;

    setUpAll(() async {
      // Connect to a running Flutter application instance.
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) driver.close();
    });

    test('tap on the floating action button; verify counter', () async {
      // Finds the floating action button to tap on.
      SerializableFinder fab = find.byTooltip('Increment');

      // Wait for the floating action button to appear.
      await driver.waitFor(fab);

      // Emulate a tap on the floating action button.
      await driver.tap(fab);

      // Wait for text to change to the desired value.
      await driver.waitFor(find.text('1'));
    });
  });
}
