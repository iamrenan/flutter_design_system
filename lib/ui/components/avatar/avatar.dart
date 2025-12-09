import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show CircleAvatar, Icons;
import 'package:flutter/widgets.dart';

import '../../core/icons.dart';
import '../../core/text_styles.dart';
import '../../core/theme/components/avatar.theme.dart';

enum AvatarSizes { sm, md, lg }

final class Avatar extends StatelessWidget {
  /// The image to display in the avatar.
  ///
  /// If null, the avatar will display initials (if any [name] was provided) or the default icon.
  final ImageProvider<Object>? image;

  /// A name to derive initials from.
  ///
  /// If null or empty, the avatar will display the default icon.
  final String? name;

  /// The size of the avatar, based on pre-defined sizes.
  final AvatarSizes size;

  const Avatar({super.key, this.image, this.name, this.size = AvatarSizes.md});

  bool get _hasImage => image != null;

  bool get _hasName => name != null && name!.trim().isNotEmpty;

  String get _formattedName {
    final names = name?.split(' ');

    if (names?.length == 1) {
      return names!.first.characters.first.toUpperCase();
    }

    return '${names!.first.characters.first}${names.last.characters.first}'
        .toUpperCase();
  }

  Color? background(AvatarThemeData? avatarTheme) {
    if (_hasImage) {
      return avatarTheme?.standard?.background;
    }
    if (_hasName) {
      return avatarTheme?.initials?.background;
    }

    // Avatar uses CircleAvatar, which already defines a fallback color.
    return avatarTheme?.standard?.background;
  }

  Color? foreground(AvatarThemeData? avatarTheme) {
    if (_hasImage) {
      return avatarTheme?.standard?.foreground;
    }
    if (_hasName) {
      return avatarTheme?.initials?.foreground;
    }

    // Avatar uses CircleAvatar, which already defines a fallback color.
    return avatarTheme?.standard?.foreground;
  }

  @override
  Widget build(BuildContext context) {
    final avatarTheme = AvatarTheme.maybeOf(context);
    final defaults = _AvatarDefaults.fromSize(size);

    Widget? child;
    ImageProvider<Object>? backgroundImage;
    if (_hasImage) {
      child = null;
      backgroundImage = image;
    } else if (_hasName) {
      child = Text(_formattedName, style: defaults.textStyle);
    } else {
      child = Icon(Icons.person_outline, size: defaults.iconSize);
    }

    return CircleAvatar(
      radius: defaults.radius,
      backgroundColor: background(avatarTheme),
      foregroundColor: foreground(avatarTheme),
      backgroundImage: backgroundImage,
      child: child,
    );
  }
}

final class _AvatarDefaults {
  final double radius;
  final double iconSize;
  final TextStyle textStyle;

  const _AvatarDefaults({
    required this.radius,
    required this.iconSize,
    required this.textStyle,
  });

  static _AvatarDefaults fromSize(AvatarSizes size) {
    return switch (size) {
      AvatarSizes.sm => _AvatarDefaults(
        radius: AvatarSize.sm / 2,
        iconSize: IconSize.xs,
        textStyle: TextStyles.bodyXs,
      ),

      AvatarSizes.md => _AvatarDefaults(
        radius: AvatarSize.md / 2,
        iconSize: IconSize.sm,
        textStyle: TextStyles.bodySm,
      ),

      AvatarSizes.lg => _AvatarDefaults(
        radius: AvatarSize.lg / 2,
        iconSize: IconSize.md,
        textStyle: TextStyles.bodyMd,
      ),
    };
  }
}

abstract class AvatarSize {
  static const double sm = IconSize.md;
  static const double md = IconSize.lg;
  static const double lg = IconSize.xl;

  final double size;

  const AvatarSize(this.size);
}
