import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final TextAlign textAlign;

  Txt({
    this.text = '',
    this.style,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: textAlign,
        style: this.style != null
            ? this.style
            : TextStyle(
                fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                color: this.color != null
                    ? this.color
                    : Theme.of(context).textTheme.bodyText1.color,
              ),
      ),
    );
  }
}
