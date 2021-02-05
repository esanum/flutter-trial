import 'package:flutter/material.dart';

// https://itnext.io/theming-your-app-in-flutter-using-bloc-save-reload-62048a330584

class AppThemes {
  static const _textSizeHeadline = 25.0;
  static const _textSizeLarge = 20.0;
  static const _textSizeDefault = 16.0;

  static final Color _primaryColor = Colors.deepPurple;
  static final Color _accentColor = Colors.green;

  static final Color _backgroundColorStrong = Colors.black;
  static final Color _backgroundColorDefault = Colors.white;

  static final Color _textColorStrong = Colors.black;
  static final Color _textColorDefault = Colors.white;

  static final String fontNameDefault = 'Muli';

  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: _backgroundColorDefault,
      primarySwatch: Colors.blue,
      primaryColor: _primaryColor,
      primaryTextTheme: TextTheme(headline6: TextStyle(color: _backgroundColorDefault)),
      primaryIconTheme: IconThemeData(color: _backgroundColorDefault),
      accentColor: _accentColor,
      accentTextTheme: TextTheme(headline6: TextStyle(color: _backgroundColorDefault)),
      accentIconTheme: IconThemeData(color: _backgroundColorDefault),
      backgroundColor: _backgroundColorDefault,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: fontNameDefault,
          color: _textColorStrong,
          fontSize: _textSizeHeadline,
        ),
        headline5: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Hind',
          color: _textColorStrong,
        ),
        headline6: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic,
          color: _textColorStrong,
        ),
        bodyText1: TextStyle(
          fontFamily: fontNameDefault,
          color: _textColorStrong,
          fontSize: _textSizeLarge,
        ),
        bodyText2: TextStyle(
          fontFamily: fontNameDefault,
          color: _textColorStrong,
          fontSize: _textSizeDefault,
        ),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: _backgroundColorStrong,
      primarySwatch: Colors.teal,
      primaryColor: _primaryColor,
      primaryTextTheme: TextTheme(headline6: TextStyle(color: _backgroundColorStrong)),
      primaryIconTheme: IconThemeData(color: _backgroundColorStrong),
      accentColor: _accentColor,
      accentTextTheme: TextTheme(headline6: TextStyle(color: _backgroundColorStrong)),
      accentIconTheme: IconThemeData(color: _backgroundColorStrong),
      backgroundColor: _backgroundColorStrong,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: fontNameDefault,
          color: _textColorDefault,
          fontSize: _textSizeHeadline,
        ),
        headline5: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Hind',
          color: _textColorDefault,
        ),
        headline6: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic,
          color: _textColorDefault,
        ),
        bodyText1: TextStyle(
          fontFamily: fontNameDefault,
          color: _textColorDefault,
          fontSize: _textSizeLarge,
        ),
        bodyText2: TextStyle(
          fontFamily: fontNameDefault,
          color: _textColorDefault,
          fontSize: _textSizeDefault,
        ),
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
