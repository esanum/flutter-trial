import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/views/albums/albums_screen.dart';
import 'package:flutter_starter/views/home_page.dart';

import 'blocs/album/albums_bloc.dart';
import 'blocs/theme/theme_bloc.dart';
import 'blocs/theme/theme_state.dart';
import 'networking/services.dart';

void main() {
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
