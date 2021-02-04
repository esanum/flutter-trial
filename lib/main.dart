import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/preferences.dart';
import 'package:flutter_starter/views/home_page.dart';

import 'blocs/theme/theme_bloc.dart';
import 'blocs/theme/theme_state.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            title: 'Flutter Trial',
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: HomePage(title: 'Flutter Trial'),
          );
        },
      ),
    );
  }
}
