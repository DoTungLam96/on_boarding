import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_on_boarding/common/widget_common.dart';
import 'package:flutter_on_boarding/utils/utils.dart';
import 'package:flutter_on_boarding/widgets/icon_widget/icon_widget.dart';

class ItemListDocumentProcessing extends StatelessWidget {
  const ItemListDocumentProcessing(
      {super.key, this.image, this.timeStamp, this.title});
  final String? title;
  final int? timeStamp;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12, bottom: 4, right: 12),
      width: 159,
      margin: const EdgeInsets.only(right: 12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconWidget(
            path: image ?? "",
            width: 40,
            height: 40,
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              title ?? "",
              style: WidgetCommon.text_font_16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            Utils.I.dateToString(timeStamp ?? 0, fomart: "dd/MM/yyyy HH:mm:ss"),
            style: WidgetCommon.text_font_14,
          ),
        ],
      ),
    );
  }
}
