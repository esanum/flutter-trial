import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/views/routes/second_route.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Open Second route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondRoute()), // Navigate to second route when tapped.
                );
              },
            ),
            ElevatedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back to first route when tapped.
              },
            ),
            ElevatedButton(
              child: Text('Go back home'),
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName('/')); // Navigate back to home
              },
            ),
          ],
        ),
      ),
    );
  }
}
