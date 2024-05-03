import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/widget_common.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetCommon.background_color_home,
        automaticallyImplyLeading: false,
        title: Text(
          "",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: WidgetCommon.background_color_home,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Document",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
      // bottomNavigationBar: AnimatedBottomBar(),
    );
  }
}
