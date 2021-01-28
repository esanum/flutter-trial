import 'package:flutter/material.dart';

import 'package:flutter_starter/model/menu_item.dart';
import 'package:flutter_starter/views/bottom_navigation.dart';
import 'package:flutter_starter/views/home_page.dart';
import 'package:flutter_starter/views/web_view_container.dart';
import 'package:flutter_starter/views/lists/list_view_jobs.dart';
import 'package:flutter_starter/views/lists/list_view_news.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  // this is static property so other widget throughout the app
  // can access it simply by AppState.currentTab
  static int currentTab = 0;

  // list tabs here
  final List<MenuItem> tabs = [
    MenuItem(
      title: "home",
      icon: Icons.home_rounded,
      page: HomePage(title: 'Flutter Trial'),
    ),
    MenuItem(
      title: "esanum",
      icon: Icons.web_rounded,
      page: WebViewContainer('https://www.esanum.de', 'Flutter Trial'),
    ),
    MenuItem(
      title: "Jobs",
      icon: Icons.list_rounded,
      page: JobsListViewScreen(),
    ),
    MenuItem(
      title: "News",
      icon: Icons.pages_rounded,
      page: NewsScreen(),
    ),
  ];

  AppState() {
    // indexing is necessary for proper functionality
    // of determining which tab is active
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  // sets current tab index
  // and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route
      // if the user taps on the active tab
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      // update the state
      // in order to repaint
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope handle android back btn
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      // this is the base scaffold
      // don't put appbar in here otherwise you might end up
      // with multiple appbars on one screen
      // eventually breaking the app
      child: Scaffold(
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        // Bottom navigation
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}
