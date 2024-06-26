// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_on_boarding/widgets/onboarding/favourite_widget.dart';
import 'package:flutter_on_boarding/cubit/search_cubit.dart';
import 'package:flutter_on_boarding/model/search_model.dart';

import '../../constant/constant.dart';
import '../../cubit/selected_item_cubit.dart';
import '../../model/interesting_model.dart';
import 'grid_view_chips.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late List<InterestingModel> listSign, listMission, listForm, listMeeting;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    listSign = LIST_INTERESTING_SIGN;
    listForm = LIST_INTERESTING_FORM;
    listMeeting = LIST_INTERESTING_MEETING;
    listMission = LIST_INTERESTING_MISSION;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Lựa chọn nội dung đồng chí quan tâm',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _buildTextSearch(),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<SearchCubit, SearchModel?>(builder: (context, state) {
            if (state?.value != null && state!.value!.isNotEmpty) {
              listSign = LIST_INTERESTING_SIGN
                  .where((element) =>
                      element.name
                          ?.toLowerCase()
                          .contains(state.value?.toLowerCase() ?? "") ??
                      false)
                  .toList();
              listForm = LIST_INTERESTING_FORM
                  .where((element) =>
                      element.name
                          ?.toLowerCase()
                          .contains(state.value?.toLowerCase() ?? "") ??
                      false)
                  .toList();
              listMeeting = LIST_INTERESTING_MEETING
                  .where((element) =>
                      element.name
                          ?.toLowerCase()
                          .contains(state.value?.toLowerCase() ?? "") ??
                      false)
                  .toList();
              listMission = LIST_INTERESTING_MISSION
                  .where((element) =>
                      element.name
                          ?.toLowerCase()
                          .contains(state.value?.toLowerCase() ?? "") ??
                      false)
                  .toList();
            } else {
              _init();
            }
            return Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridViewChips(
                      title: "Ký điện tử",
                      interestingList: listSign,
                    ),
                    GridViewChips(
                      title: "Nhiệm vụ",
                      interestingList: listMission,
                    ),
                    GridViewChips(
                      title: "Văn bản",
                      interestingList: listForm,
                    ),
                    GridViewChips(
                      title: "Lịch họp",
                      interestingList: listMeeting,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTextSearch() {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 16),
      height: 48,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 231, 231, 231).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Color.fromARGB(255, 79, 79, 79),
            size: 24.0,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Tìm nội dung quan tâm",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 129, 127, 127),
                ),
              ),
              onChanged: (value) {
                context
                    .read<SearchCubit>()
                    .searchModel(value: SearchModel().copyWith(value: value));
              },
            ),
          ),
        ],
      ),
    );
  }
}
