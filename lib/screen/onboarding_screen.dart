import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_on_boarding/screen/dashboard_screen.dart';
import 'package:flutter_on_boarding/screen/home_screen.dart';
import 'package:flutter_on_boarding/widgets/onboarding/favourite_widget.dart';
import 'package:flutter_on_boarding/widgets/onboarding/category_widget.dart';

import '../gen/assets.gen.dart';
import '../widgets/intro/intro_single_screen.dart';
import '../widgets/intro/intro_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key, this.fromSFeature}) : super(key: key);
  final bool? fromSFeature;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return IntroSingleScreen(
      initCurrentPage: 0,
      title: "",
      imageBackground: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.images.bgVoffice.path,
            ),
            fit: BoxFit.fill,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      introductionList: [
        IntroWidget(
            title: "Chào mừng tới Hệ thống \nVăn phòng số",
            imageUrl: Assets.images.introImage.path),
        const CategoryWidget(),
        const FavouriteWidget(),
      ],
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      },
      titleRightButton: "Skip",
    );
  }
}
