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
      TabItem(icon: Icons.home, title: 'Home'),
      TabItem(icon: Icons.map, title: 'Discovery'),
      TabItem(icon: Icons.add, title: 'Add'),
      TabItem(icon: Icons.message, title: 'Message'),
      TabItem(icon: Icons.people, title: 'Profile'),
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
