// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_on_boarding/common/widget_common.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';
import '../../cubit/category_cubit.dart';
import '../../model/category_model.dart';
import '../../model/interesting_model.dart';
import 'mini_feature_widget.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({
    super.key,
  });

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  List<CategoryModel> listSelected = [];
  List<CategoryModel> listUnselected = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..init(),
      child: BlocBuilder<CategoryCubit, CategoryModel?>(
        builder: (context, state) {
          listSelected = context.read<CategoryCubit>().getListSelected;
          listUnselected = context.read<CategoryCubit>().getListUnSelected;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Thiết lập menu mặc định',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildGridViewWithInsideScrolling(context)
                // _buildGridView(context)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ưa thích',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            _buildMiniFeatureSelected(context),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Menu khác',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            _buildMiniFeatureUnSelected(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGridViewWithInsideScrolling(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ưa thích',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(flex: 4, child: _buildMiniFeatureSelected(context)),
          Text(
            'Menu khác',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(flex: 3, child: _buildMiniFeatureUnSelected(context)),
        ],
      ),
    );
  }

  Widget _buildMiniFeatureSelected(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MiniFeatureWidget(
            onTap: () {
              if (listSelected.length <= 3) {
                WidgetCommon.I.showSnackBar(
                  title: "Cảnh báo",
                  content: "Danh sách ưu thích tối thiểu 3 mục",
                  bgColor: const Color.fromARGB(255, 124, 124, 124),
                  colorText: Colors.white,
                );
              } else {
                context.read<CategoryCubit>().addOrRemoveFavourite(
                    item: listSelected[index], isRemove: true);
              }
            },
            image: listSelected[index].getImage,
            title: listSelected[index].name ?? "");
      },
      itemCount: listSelected.length,
    );
  }

  Widget _buildMiniFeatureUnSelected(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MiniFeatureWidget(
            onTap: () {
              context.read<CategoryCubit>().addOrRemoveFavourite(
                  item: listUnselected[index], isRemove: false);
            },
            isAdd: true,
            image: listUnselected[index].getImage,
            title: listUnselected[index].name ?? "");
      },
      itemCount: listUnselected.length,
    );
  }
}
