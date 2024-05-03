import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class MiniFeatureWidget extends StatelessWidget {
  const MiniFeatureWidget(
      {super.key,
      required this.image,
      required this.title,
      this.isAdd,
      this.left,
      this.right,
      this.bottom,
      this.top,
      this.textStyle,
      this.onTap});
  final String title;
  final Widget image;
  final bool? isAdd;
  final double? left, right, top, bottom;

  final TextStyle? textStyle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: left ?? 4,
                    top: top ?? 4,
                    right: right ?? 0,
                    bottom: bottom ?? 0),
                child: image),
            InkWell(
              onTap: () {
                onTap?.call();
              },
              child: isAdd == true
                  ? Assets.images.icAdd.image(width: 12, height: 12)
                  : Assets.images.icMinus.image(width: 12, height: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
