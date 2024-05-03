import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WidgetCommon {
  WidgetCommon._();

  static final I = WidgetCommon._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void showSnackBar(
      {String? title,
      required String content,
      Color? bgColor,
      Color? colorText,
      SnackPosition? position}) {
    Get.snackbar(title ?? "Thông báo", content,
        backgroundColor: bgColor ?? const Color.fromARGB(255, 139, 139, 139),
        colorText: colorText ?? Colors.white,
        snackPosition: position ?? SnackPosition.BOTTOM);
  }

  static TextStyle get text_font_18 => Theme.of(navigatorKey.currentContext!)
      .textTheme
      .bodyMedium!
      .copyWith(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black);

  static TextStyle get text_font_20 => Theme.of(navigatorKey.currentContext!)
      .textTheme
      .bodyMedium!
      .copyWith(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black);

  static TextStyle get text_font_14 => Theme.of(navigatorKey.currentContext!)
      .textTheme
      .bodyMedium!
      .copyWith(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black);

  static TextStyle get text_font_16 => Theme.of(navigatorKey.currentContext!)
      .textTheme
      .bodyMedium!
      .copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black);
}
