import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/views/routes/first_route.dart';
import 'package:flutter_starter/views/widgets/txt.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Txt(text: 'Second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Txt(text: 'Open First route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FirstRoute()), // Navigate to second route when tapped.
                );
              },
            ),
            ElevatedButton(
              child: Txt(text: 'Go back'),
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back to first route when tapped.
              },
            ),
            ElevatedButton(
              child: Txt(text: 'Go back home'),
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
