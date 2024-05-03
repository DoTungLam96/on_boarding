import 'package:flutter/material.dart';

import '../common/widget_common.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetCommon.background_color_home,
        automaticallyImplyLeading: false,
        title: Text(
          "Mission",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: WidgetCommon.background_color_home,
        child: Column(
          children: [
            Text(
              "Mission Screen",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
      // bottomNavigationBar: AnimatedBottomBar(),
    );
  }
}
