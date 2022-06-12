import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_idea_sorter/presentation/details/tabs/tab_info.dart';

typedef TabClickCallback = void Function(int index);

class TabFactory {
  Map<TabInfo, Widget> tabs = {};

  /// private constructor, so noone can create an instance of this class
  TabFactory._();

  /// generates all available tabs, which should be shown
  static Map<TabInfo, Widget> buildTabs(BuildContext context) {
    return {};
  }

  static List<TabItem> buildTabItems(BuildContext context) {
    return [
      const TabItem(icon: Icons.home, title: 'Home'),
      const TabItem(icon: Icons.description, title: 'Details'),
      const TabItem(icon: Icons.analytics, title: 'Analytics'),
      const TabItem(icon: Icons.broken_image, title: 'Risks'),
      const TabItem(icon: Icons.attach_money, title: 'Finance'),
    ];
  }

  static Widget buildBottomNavigationBar(
      BuildContext context, int currentIndex, TabClickCallback callback) {
    return ConvexAppBar.badge(
      {},
      //style: TabStyle.fixed,
      items: buildTabItems(context),
      initialActiveIndex: currentIndex,
      onTap: callback,
    );
  }
}
