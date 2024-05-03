// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_on_boarding/screen/document_screen.dart';
import 'package:flutter_on_boarding/screen/home_screen.dart';
import 'package:flutter_on_boarding/screen/meeting_screen.dart';
import 'package:flutter_on_boarding/screen/mission_screen.dart';
import 'package:flutter_on_boarding/screen/signature_screen.dart';

import '../widgets/bottom_navigation_bar/curved_navigation_bar.dart';
import '../widgets/bottom_navigation_bar/curved_navigation_bar_item.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _pageIndex = 0;
  late PageController _pageController;
  late GlobalKey<CurvedNavigationBarState> _bottomNavigationKey;
  @override
  void initState() {
    _bottomNavigationKey = GlobalKey();
    _pageController = PageController();

    // if (Platform.isIOS) {
    //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.black,
    //   ));
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            DocumentScreen(),
            SignatureScreen(),
            MeetingScreen(),
            MissionScreen()
          ],
        ),
        bottomNavigationBar: _buildBottomNavBar(context));
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: _pageIndex,
      items: [
        CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Color.fromARGB(255, 57, 57, 57)),
            labelStyleActive: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.red),
            activeIcon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            )),
        CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Search',
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Color.fromARGB(255, 57, 57, 57)),
            labelStyleActive: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.red),
            activeIcon: Icon(
              Icons.search,
              color: Colors.white,
            )),
        CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Color.fromARGB(255, 57, 57, 57)),
            labelStyleActive: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.red),
            activeIcon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            )),
        CurvedNavigationBarItem(
            child: Icon(Icons.newspaper),
            label: 'Feed',
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Color.fromARGB(255, 57, 57, 57)),
            labelStyleActive: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.red),
            activeIcon: Icon(
              Icons.newspaper,
              color: Colors.white,
            )),
        CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Personal',
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Color.fromARGB(255, 57, 57, 57)),
            labelStyleActive: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.red),
            activeIcon: Icon(
              Icons.perm_identity,
              color: Colors.white,
            )),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _pageIndex = index;
        });
        _pageController.jumpToPage(index);
      },
      letIndexChange: (index) => true,
    );
  }
}
