import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_on_boarding/common/widget_common.dart';
import 'package:flutter_on_boarding/cubit/search_cubit.dart';
import 'package:flutter_on_boarding/screen/home_screen.dart';
import 'package:get/get.dart';

import 'cubit/selected_item_cubit.dart';

import 'widgets/onboarding/category_widget.dart';
import 'screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: WidgetCommon.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SelectedItemCubit>(
            create: (BuildContext context) => SelectedItemCubit(),
          ),
          BlocProvider<SearchCubit>(
            create: (BuildContext context) => SearchCubit(),
          ),
        ],
        child: const OnBoardingScreen(),
      ),
    );
  }
}
