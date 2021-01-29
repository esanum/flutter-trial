import 'package:flutter/material.dart';
import 'package:flutter_starter/model/drawer_item.dart';
import 'package:flutter_starter/views/first_route.dart';
import 'package:flutter_starter/views/lists/list_view_jobs.dart';
import 'package:flutter_starter/views/lists/list_view_news.dart';
import 'package:flutter_starter/views/web_view_container.dart';

// https://medium.com/@kashifmin/flutter-setting-up-a-navigation-drawer-with-multiple-fragments-widgets-1914fda3c8a8
// https://medium.com/@maffan/how-to-create-a-side-menu-in-flutter-a2df7833fdfb

// ignore: must_be_immutable
class SideDrawer extends StatefulWidget {
  List<DrawerItem> drawerItems = <DrawerItem>[
    DrawerItem('First route', Icons.home, Colors.teal),
    DrawerItem('News', Icons.business, Colors.cyan),
    DrawerItem('Jobs', Icons.school, Colors.orange),
    DrawerItem('Esanum', Icons.flight, Colors.blue)
  ];

  @override
  State<StatefulWidget> createState() {
    return new SideDrawerState();
  }
}

class SideDrawerState extends State<SideDrawer> {
  int _selectedDrawerIndex = 0;

  void _getDrawerItemWidget(int pos) {
    Widget route;
    switch (pos) {
      case 0:
        {
          route = new FirstRoute();
        }
        break;
      case 1:
        {
          route = new NewsScreen();
        }
        break;
      case 2:
        {
          route = new JobsListViewScreen();
        }
        break;
      case 3:
        {
          route = new WebViewContainer('https://www.esanum.de', 'esanum');
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => route), // Navigate to second route when tapped.
    );
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      _getDrawerItemWidget(_selectedDrawerIndex);
    });
    //Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/graphics/image.jpg'))),
          ),
          //new UserAccountsDrawerHeader(
          //accountName: new Text("John Doe"), accountEmail: null), // two types of header in menu
          new Column(children: drawerOptions)
        ],
      ),
    );
  }
}
