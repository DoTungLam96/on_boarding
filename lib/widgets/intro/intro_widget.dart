import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.mainTitle,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  final String? mainTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 46, left: 24, right: 24),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            width: 360,
            height: 360,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          // _buildBottom(context)
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Color(0xffEE0033),
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              'Tiếp tục',
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
}
