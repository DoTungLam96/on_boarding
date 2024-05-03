import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_on_boarding/widgets/icon_widget/icon_widget.dart';

import '../../gen/assets.gen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar(
      {Key? key,
      this.title,
      this.child,
      this.actions,
      this.onBack,
      this.leadingWidth,
      this.titleSpacing,
      this.centerTitle = true,
      this.leadingIcon,
      this.leading,
      this.titleStyle,
      this.isClose,
      this.onClose,
      this.automaticallyImplyLeading = true,
      this.flexibleSpace,
      this.elevation,
      this.backgroundColor})
      : super(key: key);

  final String? title;
  final Widget? child;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final double? leadingWidth;
  final double? titleSpacing;
  final bool centerTitle;
  final String? leadingIcon;
  final Widget? leading;
  final TextStyle? titleStyle;

  final bool? isClose;
  final VoidCallback? onClose;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final Widget? flexibleSpace;
  final double? elevation;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.blue,
      centerTitle: centerTitle,
      leading: _buildLeadingWidget(context),
      elevation: elevation ?? 0,
      flexibleSpace: flexibleSpace,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing,
      automaticallyImplyLeading: automaticallyImplyLeading,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      title: child ??
          Text(
            title ?? '',
            style: titleStyle ??
                Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
          ),
      actions: actions,
    );
  }

  Widget? _buildLeadingWidget(BuildContext context) {
    if (!automaticallyImplyLeading) {
      return null;
    }
    if (leading != null) {
      return leading;
    }
    if (isClose == true) {
      return IconButton(
          icon: IconWidget.ic24(path: leadingIcon ?? Assets.images.icClose),
          onPressed: () {
            onClose?.call();
          });
    }
    return IconButton(
        icon: IconWidget.ic24(
            color: Colors.white,
            path: leadingIcon ?? Assets.images.icArrowLineLeft),
        onPressed: onBack != null
            ? onBack!
            : () {
                Navigator.maybePop(context);
              });
  }
}
