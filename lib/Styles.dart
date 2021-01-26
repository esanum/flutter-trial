import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;
  static final Color _textColorStrong = Colors.black;
  static final Color _textColorDefault = Colors.black;
  static final String fontNameDefault = 'Muli';
  static final navBarTitle = TextStyle(
    fontFamily: fontNameDefault,
  );
  static final headerLarge = TextStyle(
      fontFamily: fontNameDefault,
      fontSize: _textSizeLarge,
      color: _textColorStrong);
  static final textDefault = TextStyle(
      fontFamily: fontNameDefault,
      fontSize: _textSizeDefault,
      color: _textColorDefault);
}
