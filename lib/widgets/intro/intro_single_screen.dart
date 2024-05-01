import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/src/services/system_chrome.dart';

import 'intro_widget.dart';

class IntroSingleScreen extends StatefulWidget {
  const IntroSingleScreen({
    Key? key,
    this.initCurrentPage = 0,
    this.introductionList,
    this.onTapSkipButton,
    this.backgroundColor,
    this.foregroundColor,
    this.title,
    this.titleRightButton,
    this.titleLeftButton,
    required this.imageBackground,
    this.btnTitle,
    this.skipTextStyle = const TextStyle(fontSize: 20),
  }) : super(key: key);
  final int initCurrentPage;
  final Widget imageBackground;
  final List<Widget>? introductionList;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;
  final String? titleLeftButton;
  final String? titleRightButton;
  final String? title;
  final String? btnTitle;

  /// Callback on Skip Button Pressed
  final Function()? onTapSkipButton;

  @override
  IntroSingleScreenState createState() => IntroSingleScreenState();
}

class IntroSingleScreenState extends State<IntroSingleScreen> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  double progressPercent = 0;
  final List<Widget> _introductionList = [];

  @override
  void initState() {
    _currentPage = widget.initCurrentPage;
    _pageController = PageController(initialPage: _currentPage);
    _getDataList();
    super.initState();
  }

  void _getDataList() {
    for (int i = 0; i < widget.introductionList!.length; i++) {
      _introductionList.add(widget.introductionList![i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Color.fromARGB(255, 237, 247, 255),
            child: widget.imageBackground,
          ),
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 176,
                          height: 40,
                          child: Text(
                            widget.title ?? "",
                            style: Theme.of(context).textTheme.bodyMedium!,
                          )),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: _introductionList!,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildBtnNext(context),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _buildNextSkip(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBtnNext(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _currentPage != _introductionList!.length - 1
                ? _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  )
                : widget.onTapSkipButton?.call();
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
            decoration: BoxDecoration(
                color: Color(0xffEE0033),
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              _currentPage == _introductionList!.length - 1
                  ? 'Hoàn tất'
                  : 'Tiếp tục',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: isActive ? 6 : 4,
      width: isActive ? 6 : 4,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF7B51D3) : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    final List<Widget> list = [];
    for (int i = 0; i < _introductionList!.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _buildNextSkip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  widget.onTapSkipButton?.call();
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 48,
                  width: 100,
                  child: Text(widget.titleLeftButton ?? "",
                      style: Theme.of(context).textTheme.bodyMedium!),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  widget.onTapSkipButton?.call();
                },
                child: Text(widget.titleRightButton ?? ""),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
