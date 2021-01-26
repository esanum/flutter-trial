import 'package:flutter/material.dart';
import 'package:flutter_starter/model/menu_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({@required this.currentTab, @required this.onSelectTab});
  final MenuItem currentTab;
  final ValueChanged<MenuItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(MenuItem.red),
        _buildItem(MenuItem.green),
        _buildItem(MenuItem.blue),
      ],
      onTap: (index) => onSelectTab(
        MenuItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(MenuItem menuItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        color: _colorTabMatching(menuItem),
      ),
      label: tabName[menuItem],
    );
  }

  Color _colorTabMatching(MenuItem item) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}
