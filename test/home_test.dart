import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_starter/core/app_themes.dart';
import 'package:flutter_starter/core/theme_preferences.dart';
import 'package:flutter_starter/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  _testCounter();
  _testTheme();
}

void _testCounter() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Mock preferences
    SharedPreferences.setMockInitialValues({}); //set values here
    await ThemePreferences.init();

    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

void _testTheme() {
  testWidgets('Testing theme', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Mock preferences
    SharedPreferences.setMockInitialValues({}); //set values here
    // Init theme preferences
    await ThemePreferences.init();

    SharedPreferences pref = await SharedPreferences.getInstance();

    await tester.pumpWidget(MyApp());

    expect(null, pref.getString('key_selected_theme'));

    var brightness = SchedulerBinding.instance.window.platformBrightness; // system theme
    AppTheme appTheme = brightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme;

    expect(appTheme, ThemePreferences.getTheme());
  });
}
