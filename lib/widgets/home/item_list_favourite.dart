import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_on_boarding/common/widget_common.dart';
import 'package:flutter_on_boarding/widgets/icon_widget/icon_widget.dart';

class ItemListFavourite extends StatelessWidget {
  const ItemListFavourite(
      {super.key,
      this.amout,
      this.pathImage,
      this.title,
      this.titleTextStyle,
      this.imageWidget});
  final String? pathImage;
  final String? title;
  final TextStyle? titleTextStyle;
  final int? amout;
  final Widget? imageWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 98,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageWidget ??
                  IconWidget.ic48(
                    path: pathImage ?? "",
                  ),
              const SizedBox(
                height: 8,
              ),
              Flexible(
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: titleTextStyle ?? WidgetCommon.text_font_14,
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 4,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '$amout'.length > 3 ? "999+" : '$amout',
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle ??
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
