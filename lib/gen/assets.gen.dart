/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.svg
  String get background => 'assets/images/background.svg';

  /// File path: assets/images/bg_voffice.png
  AssetGenImage get bgVoffice =>
      const AssetGenImage('assets/images/bg_voffice.png');

  /// File path: assets/images/ic_add.png
  AssetGenImage get icAdd => const AssetGenImage('assets/images/ic_add.png');

  /// File path: assets/images/ic_collab.png
  AssetGenImage get icCollab =>
      const AssetGenImage('assets/images/ic_collab.png');

  /// File path: assets/images/ic_communicate.png
  AssetGenImage get icCommunicate =>
      const AssetGenImage('assets/images/ic_communicate.png');

  /// File path: assets/images/ic_contact.png
  AssetGenImage get icContact =>
      const AssetGenImage('assets/images/ic_contact.png');

  /// File path: assets/images/ic_home.png
  AssetGenImage get icHome => const AssetGenImage('assets/images/ic_home.png');

  /// File path: assets/images/ic_library.png
  AssetGenImage get icLibrary =>
      const AssetGenImage('assets/images/ic_library.png');

  /// File path: assets/images/ic_meeting.png
  AssetGenImage get icMeeting =>
      const AssetGenImage('assets/images/ic_meeting.png');

  /// File path: assets/images/ic_minus.png
  AssetGenImage get icMinus =>
      const AssetGenImage('assets/images/ic_minus.png');

  /// File path: assets/images/ic_mission.png
  AssetGenImage get icMission =>
      const AssetGenImage('assets/images/ic_mission.png');

  /// File path: assets/images/ic_sign.png
  AssetGenImage get icSign => const AssetGenImage('assets/images/ic_sign.png');

  /// File path: assets/images/ic_sign_hub.png
  AssetGenImage get icSignHub =>
      const AssetGenImage('assets/images/ic_sign_hub.png');

  /// File path: assets/images/ic_storage.png
  AssetGenImage get icStorage =>
      const AssetGenImage('assets/images/ic_storage.png');

  /// File path: assets/images/ic_text.png
  AssetGenImage get icText => const AssetGenImage('assets/images/ic_text.png');

  /// File path: assets/images/intro_image.png
  AssetGenImage get introImage =>
      const AssetGenImage('assets/images/intro_image.png');

  /// List of all assets
  List<dynamic> get values => [
        background,
        bgVoffice,
        icAdd,
        icCollab,
        icCommunicate,
        icContact,
        icHome,
        icLibrary,
        icMeeting,
        icMinus,
        icMission,
        icSign,
        icSignHub,
        icStorage,
        icText,
        introImage
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
