/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/logo_icon.png
  AssetGenImage get logoIcon =>
      const AssetGenImage('assets/icons/logo_icon.png');

  /// File path: assets/icons/maple_story.webp
  AssetGenImage get mapleStory =>
      const AssetGenImage('assets/icons/maple_story.webp');

  /// List of all assets
  List<AssetGenImage> get values => [logoIcon, mapleStory];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arcana.png
  AssetGenImage get arcana => const AssetGenImage('assets/images/arcana.png');

  /// File path: assets/images/orange.gif
  AssetGenImage get orange => const AssetGenImage('assets/images/orange.gif');

  /// File path: assets/images/pink.gif
  AssetGenImage get pink => const AssetGenImage('assets/images/pink.gif');

  /// File path: assets/images/pink_alert.png
  AssetGenImage get pinkAlert =>
      const AssetGenImage('assets/images/pink_alert.png');

  /// File path: assets/images/slime.gif
  AssetGenImage get slime => const AssetGenImage('assets/images/slime.gif');

  /// File path: assets/images/yetti.gif
  AssetGenImage get yetti => const AssetGenImage('assets/images/yetti.gif');

  /// File path: assets/images/zaqqum.gif
  AssetGenImage get zaqqum => const AssetGenImage('assets/images/zaqqum.gif');

  /// List of all assets
  List<AssetGenImage> get values =>
      [arcana, orange, pink, pinkAlert, slime, yetti, zaqqum];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String mapleStoryBook = 'maple_story_book.env';

  /// List of all assets
  static List<String> get values => [mapleStoryBook];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
