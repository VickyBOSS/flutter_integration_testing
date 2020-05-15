import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("My Integration Test", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });

    var textField = find.byType('TextField');
    var btn = find.text('Click');

    test("Flutter Integration Test", () async {
      await driver.tap(textField);
      await driver.enterText("VickyBOSS");
      await driver.tap(btn);
      await driver.waitUntilNoTransientCallbacks();
    });
  });
}
