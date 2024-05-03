import 'package:flutter/material.dart';

import '../common/widget_common.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
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
        color: WidgetCommon.background_color_home,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Meeting Screen",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
      // bottomNavigationBar: AnimatedBottomBar(),
    );
  }
}
