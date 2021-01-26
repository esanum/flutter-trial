import 'package:flutter/material.dart';
import 'package:flutter_starter/views/color_detail_page.dart';
import 'package:flutter_starter/views/colors_list_page.dart';
import 'package:flutter_starter/model/menu_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.menuItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final MenuItem menuItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => ColorsListPage(
            color: activeTabColor[menuItem],
            title: tabName[menuItem],
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: activeTabColor[menuItem],
            title: tabName[menuItem],
            materialIndex: materialIndex,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
