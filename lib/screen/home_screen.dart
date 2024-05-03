// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_on_boarding/gen/assets.gen.dart';
import 'package:flutter_on_boarding/mock/list_document_home.dart';
import 'package:flutter_on_boarding/widgets/appbar/base_app_bar.dart';
import 'package:flutter_on_boarding/widgets/home/item_list_document.dart';
import 'package:flutter_on_boarding/widgets/icon_widget/icon_widget.dart';
import 'package:flutter_on_boarding/widgets/scaffold/scaffold_base.dart';

import '../common/widget_common.dart';
import '../mock/list_favourite_home_mock.dart';
import '../widgets/home/item_list_document_processing.dart';
import '../widgets/home/item_list_favourite.dart';
import '../widgets/home/mission_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: WidgetCommon.background_color_home,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(
            height: 4,
          ),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMissionChart(context),
            const SizedBox(
              height: 24,
            ),
            _buildMeetingCalendart(context),
            const SizedBox(
              height: 24,
            ),
            _buidDocument(context),
            const SizedBox(
              height: 24,
            ),
            _buidDocumentInprocess(context),
          ],
        ),
      ),
    ));
  }

  Widget _buidDocumentInprocess(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tài liệu đang xử lý",
              style: WidgetCommon.text_font_18,
            ),
            InkWell(
              onTap: () {
                WidgetCommon.I.showSnackBar(content: "Xem thêm");
              },
              child: IconWidget.ic24(path: Assets.images.icXemthem),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 204,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 16),
            scrollDirection: Axis.horizontal,
            itemCount: ListDocumentInprocessHome.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return ItemListDocumentProcessing(
                timeStamp: ListDocumentInprocessHome[i].timeStamp,
                image: ListDocumentInprocessHome[i].imagePath,
                title: ListDocumentInprocessHome[i].title,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buidDocument(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Văn bản quan tâm",
              style: WidgetCommon.text_font_18,
            ),
            InkWell(
                onTap: () {
                  WidgetCommon.I.showSnackBar(content: "Xem thêm");
                },
                child: IconWidget.ic24(path: Assets.images.icXemthem))
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.only(top: 16),
          scrollDirection: Axis.vertical,
          itemCount: ListDocumentHome.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return ItemListDocument(
              timeStamp: ListDocumentHome[i].timeStamp,
              image: ListDocumentHome[i].imagePath,
              title: ListDocumentHome[i].title,
            );
          },
        )
      ],
    );
  }

  Widget _buildMissionChart(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 350,
      child: Column(
        children: [
          Text(
            "Nhiệm vụ đơn vị",
            style: WidgetCommon.text_font_18,
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child:
                Container(height: 350, child: StackedBarChart.withSampleData()),
          )
        ],
      ),
    );
  }

  Widget _buildMeetingCalendart(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Text(
        "Lịch họp hôm nay",
        style: WidgetCommon.text_font_18,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: 294,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Assets.images.bgHome.path,
                ),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              _buildAppBar(context),
              const SizedBox(
                height: 16,
              ),
              _buildFavouriteHeader(context),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFavouriteHeader(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 231, 231, 231),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildFavourites(context)),
            InkWell(
                onTap: () {
                  WidgetCommon.I.showSnackBar(content: "Chỉnh sửa Home");
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: IconWidget.ic24(path: Assets.images.icEditHome)))
          ],
        ),
      ),
    );
  }

  Widget _buildFavourites(BuildContext context) {
    return ListView.builder(
      itemCount: ListFavouriteHome.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return ItemListFavourite(
          amout: ListFavouriteHome[i].count,
          pathImage: ListFavouriteHome[i].imagePath,
          title: ListFavouriteHome[i].title,
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return BaseAppBar(
      backgroundColor: Colors.transparent,
      title: "Đỗ Tùng Lâm",
      centerTitle: false,
      leadingWidth: 48,
      leading: InkWell(
        onTap: () {
          WidgetCommon.I.showSnackBar(
            content: "Click Search",
          );
        },
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                Assets.images.avatarA.path,
              ),
            )),
      ),
      actions: [
        InkWell(
          onTap: () {
            WidgetCommon.I.showSnackBar(
              content: "Click Search",
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconWidget.ic18(
              path: Assets.images.icSearch,
              noTintColor: true,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            WidgetCommon.I.showSnackBar(
              title: "Cảnh báo",
              content: "Click Cảnh báo",
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconWidget.ic18(
              path: Assets.images.icBell,
              noTintColor: true,
            ),
          ),
        )
      ],
    );
  }
}
