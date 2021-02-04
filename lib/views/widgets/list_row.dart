import 'package:flutter/material.dart';
import 'package:flutter_starter/model/album.dart';
import 'package:flutter_starter/views/widgets/txt.dart';

class ListRow extends StatelessWidget {
  //
  final Album album;

  ListRow({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album.title),
          Divider(),
        ],
      ),
    );
  }
}
