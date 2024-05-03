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
      padding: const EdgeInsets.all(12),
      width: 159,
      margin: const EdgeInsets.only(right: 12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconWidget(
            path: image ?? "",
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            title ?? "",
            style: WidgetCommon.text_font_16,
          ),
          const SizedBox(
            width: 8,
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
