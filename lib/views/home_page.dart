import 'package:flutter/material.dart';
import 'package:flutter_starter/views/bottom_navigation.dart';
import 'package:flutter_starter/model/menu_item.dart';
import 'package:flutter_starter/views/tab_navigator.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _currentTab = MenuItem.red;
  final _navigatorKeys = {
    MenuItem.red: GlobalKey<NavigatorState>(),
    MenuItem.green: GlobalKey<NavigatorState>(),
    MenuItem.blue: GlobalKey<NavigatorState>(),
  };

  void _selectTab(MenuItem MenuItem) {
    if (MenuItem == _currentTab) {
      // pop to first route
      _navigatorKeys[MenuItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = MenuItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != MenuItem.red) {
            // select 'main' tab
            _selectTab(MenuItem.red);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(MenuItem.red),
          _buildOffstageNavigator(MenuItem.green),
          _buildOffstageNavigator(MenuItem.blue),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(MenuItem menuItem) {
    return Offstage(
      offstage: _currentTab != menuItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[menuItem],
        menuItem: menuItem,
      ),
    );
  }
}
