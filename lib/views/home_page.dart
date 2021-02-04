import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/blocs/album/albums_bloc.dart';
import 'package:flutter_starter/networking/services.dart';
import 'package:flutter_starter/views/lists/list_view_jobs.dart';
import 'package:flutter_starter/views/lists/list_view_news.dart';
import 'package:flutter_starter/views/web/web_view_container.dart';
import 'package:flutter_starter/views/widgets/txt.dart';

import 'albums/albums_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.blue);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: BLoC',
      style: optionStyle,
    ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Txt(text: widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Webview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'List view',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'List + Detail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.block),
            label: 'Bloc',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      getScreen(_selectedIndex);
    });
  }

  void getScreen(int selectedIndex) {
    Widget route;

    switch (selectedIndex) {
      case 0:
        {
          //route = FirstRoute();
          route = WebViewContainer('https://www.esanum.de', 'esanum');
        }
        break;

      case 1:
        {
          //route = SecondRoute();
          route = JobsListViewScreen();
        }
        break;

      case 2:
        {
          //route = ThirdRoute();
          route = NewsScreen();
        }
        break;
      case 3:
        //route = AlbumsScreen();
        Navigator.of(context).push(
          MaterialPageRoute<AlbumsScreen>(
            builder: (context) {
              return BlocProvider(
                create: (BuildContext context) =>
                    AlbumsBloc(albumsRepo: AlbumServices()),
                child: AlbumsScreen(),
              );
            },
          ),
        );
        route = null;
        break;
      default:
        {
          //statements;
        }
        break;
    }
    if (!isNullEmptyOrFalse(route)) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                route), // Navigate to second route when tapped.
      );
    }
  }

  bool isNullEmptyOrFalse(Object o) => o == null || false == o || "" == o;
}
