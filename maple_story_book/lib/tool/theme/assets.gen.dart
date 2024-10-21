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

  /// File path: assets/images/arcane_world.png
  AssetGenImage get arcaneWorld =>
      const AssetGenImage('assets/images/arcane_world.png');

  /// File path: assets/images/aurora_world.png
  AssetGenImage get auroraWorld =>
      const AssetGenImage('assets/images/aurora_world.png');

  /// File path: assets/images/bera_world.png
  AssetGenImage get beraWorld =>
      const AssetGenImage('assets/images/bera_world.png');

  /// File path: assets/images/bunning_world.png
  AssetGenImage get bunningWorld =>
      const AssetGenImage('assets/images/bunning_world.png');

  /// File path: assets/images/croa_world.png
  AssetGenImage get croaWorld =>
      const AssetGenImage('assets/images/croa_world.png');

  /// File path: assets/images/elysium_world.png
  AssetGenImage get elysiumWorld =>
      const AssetGenImage('assets/images/elysium_world.png');

  /// File path: assets/images/enosis_world.png
  AssetGenImage get enosisWorld =>
      const AssetGenImage('assets/images/enosis_world.png');

  /// File path: assets/images/luna_world.png
  AssetGenImage get lunaWorld =>
      const AssetGenImage('assets/images/luna_world.png');

  /// File path: assets/images/maple_whole_world.png
  AssetGenImage get mapleWholeWorld =>
      const AssetGenImage('assets/images/maple_whole_world.png');

  /// File path: assets/images/nova_world.png
  AssetGenImage get novaWorld =>
      const AssetGenImage('assets/images/nova_world.png');

  /// File path: assets/images/orange.gif
  AssetGenImage get orange => const AssetGenImage('assets/images/orange.gif');

  /// File path: assets/images/pink.gif
  AssetGenImage get pink => const AssetGenImage('assets/images/pink.gif');

  /// File path: assets/images/pink_alert.png
  AssetGenImage get pinkAlert =>
      const AssetGenImage('assets/images/pink_alert.png');

  /// File path: assets/images/reboot_world.png
  AssetGenImage get rebootWorld =>
      const AssetGenImage('assets/images/reboot_world.png');

  /// File path: assets/images/red_world.png
  AssetGenImage get redWorld =>
      const AssetGenImage('assets/images/red_world.png');

  /// File path: assets/images/skania_world.png
  AssetGenImage get skaniaWorld =>
      const AssetGenImage('assets/images/skania_world.png');

  /// File path: assets/images/slime.gif
  AssetGenImage get slime => const AssetGenImage('assets/images/slime.gif');

  /// File path: assets/images/union_world.png
  AssetGenImage get unionWorld =>
      const AssetGenImage('assets/images/union_world.png');

  /// File path: assets/images/yetti.gif
  AssetGenImage get yetti => const AssetGenImage('assets/images/yetti.gif');

  /// File path: assets/images/zaqqum.gif
  AssetGenImage get zaqqum => const AssetGenImage('assets/images/zaqqum.gif');

  /// File path: assets/images/zenith_world.png
  AssetGenImage get zenithWorld =>
      const AssetGenImage('assets/images/zenith_world.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        arcana,
        arcaneWorld,
        auroraWorld,
        beraWorld,
        bunningWorld,
        croaWorld,
        elysiumWorld,
        enosisWorld,
        lunaWorld,
        mapleWholeWorld,
        novaWorld,
        orange,
        pink,
        pinkAlert,
        rebootWorld,
        redWorld,
        skaniaWorld,
        slime,
        unionWorld,
        yetti,
        zaqqum,
        zenithWorld
      ];
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
