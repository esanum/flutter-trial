import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter/model/job.dart';
import 'package:flutter_starter/views/widgets/txt.dart';
import 'package:http/http.dart' as http;

class JobsListViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JobsListViewScreenState();
  }
}

class _JobsListViewScreenState extends State<JobsListViewScreen> {
  final List<Job> items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          title: Txt(
        text: "Job Portal",
        style: Theme.of(context).textTheme.headline1,
      )),
      body: Center(child: projectWidget()),
    );
  }

  Widget projectWidget() {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Txt(text: "${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Job>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].position, data[index].company, Icons.work);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Txt(text: title, style: Theme.of(context).textTheme.bodyText1),
        subtitle:
            Txt(text: subtitle, style: Theme.of(context).textTheme.bodyText2),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}
