import 'package:flutter/material.dart';

class IconMapper {
  static final Map<String, IconData> _iconList = {
    Icons.add.toString(): Icons.add,
    Icons.question_mark.toString(): Icons.question_mark
  };

  /// private constructor
  IconMapper._();

  static IconData getIcon(String iconName) {
    /// TODO: add other icons

    if (_iconList.containsKey(iconName)) {
      return _iconList[iconName]!;
    }

    /// if the icon is unknown
    return Icons.question_mark;
  }
}
