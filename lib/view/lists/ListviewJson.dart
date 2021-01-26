import 'package:flutter/material.dart';
import 'JobsListView.dart';

class ListViewApiJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Job Portal'),
        ),
        body: Center(child: JobsListView()),
      ),
    );
  }
}
