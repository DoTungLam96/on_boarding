import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxConstraints? constraints;
  final Color? color;
  final double radius;
  final Decoration? decoration;
  final List<BoxShadow>? boxShadow;
  final ImageProvider? image;
  final bool? disabled;
  final BoxFit? imageFit;

  const CardContainer(
      {Key? key,
      required this.child,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.constraints,
      this.color,
      this.radius = 8,
      this.decoration,
      this.boxShadow,
      this.image,
      this.imageFit,
      this.disabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(boxShadow == null || decoration == null,
        'Cannot provide both a boxShadow and a decoration');

    DecorationImage? decorationImage;
    if (image != null) {
      decorationImage = DecorationImage(
        image: image!,
        fit: imageFit ?? BoxFit.cover,
      );
    }

    return Opacity(
      opacity: disabled == true ? 0.3 : 1,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(16),
        //default margin for shadow
        margin: margin ?? const EdgeInsets.all(1),
        constraints: constraints,
        decoration: decoration ??
            BoxDecoration(
              color: color ?? Colors.white,
              borderRadius: BorderRadius.circular(radius),
              image: decorationImage,
              boxShadow: boxShadow ??
                  const [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 2,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
            ),
        child: child,
      ),
    );
  }
}
