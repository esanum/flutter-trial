import 'package:flutter/material.dart';

import 'jobs_list_view.dart';

//https://www.melvinvivas.com/flutter-listview-example-using-data-from-a-rest-api/

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
