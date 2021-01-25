import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'HomePage.dart';
// This file has to be created manually with the correct contents
//
// You can copy `.github/secret_constants.ci.dart` to
// `lib/secret_constants.dart` and fill in the correct values.
import 'secret_constants.dart' as SecretConstants;

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = SecretConstants.SENTRY_DSN;
    },

    // Init your App.
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Trial',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt o the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Trial'),
    );
  }
}
