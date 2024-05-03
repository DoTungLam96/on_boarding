import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_on_boarding/common/widget_common.dart';
import 'package:flutter_on_boarding/utils/utils.dart';
import 'package:flutter_on_boarding/widgets/icon_widget/icon_widget.dart';

class ItemListDocument extends StatelessWidget {
  const ItemListDocument({super.key, this.image, this.timeStamp, this.title});
  final String? title;
  final int? timeStamp;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconWidget(
            path: image ?? "",
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: WidgetCommon.text_font_16,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  Utils.I.dateToString(timeStamp ?? 0, fomart: "dd/MM/yyyy"),
                  style: WidgetCommon.text_font_14,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
