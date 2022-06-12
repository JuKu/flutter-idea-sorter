import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

@immutable
class TabInfo {
  final String title;
  final IconData icon;
  final Widget badge;

  const TabInfo(this.title, this.icon, this.badge);
}
