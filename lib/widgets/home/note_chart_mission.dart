import 'package:flutter/material.dart';

import '../../common/widget_common.dart';

class NoteChart extends StatelessWidget {
  const NoteChart({super.key, this.color, this.title});
  final String? title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 6),
          width: 14,
          height: 14,
          color: color ?? Color(0xff00A773),
        ),
        Text(title ?? "", style: WidgetCommon.text_font_14)
      ],
    );
  }
}
