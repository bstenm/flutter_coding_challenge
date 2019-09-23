import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Contact List App', () {
    final titleFinder = find.byValueKey('title');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Displays app title', () async {
      expect(await driver.getText(titleFinder), 'My Contacts');
    });
  });
}
