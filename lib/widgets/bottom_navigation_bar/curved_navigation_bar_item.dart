import 'package:flutter/material.dart';

class CurvedNavigationBarItem {
  /// Icon of [CurvedNavigationBarItem].
  final Widget child;

  /// Text of [CurvedNavigationBarItem].
  final String? label;

  /// TextStyle for [label].
  final TextStyle? labelStyle;

  final Widget? activeIcon;

  final TextStyle? labelStyleActive;

  const CurvedNavigationBarItem(
      {required this.child,
      this.label,
      this.labelStyle,
      this.activeIcon,
      this.labelStyleActive});
}
