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

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return _ImageAvatar(key: key, image: image, size: size);
    }
    if (name != null && name!.trim().isNotEmpty) {
      return _InitialsAvatar(key: key, name: name!.trim(), size: size);
    }
    return _DefaultAvatar(key: key, size: size);
  }
}

final class _DefaultAvatar extends StatelessWidget {
  final AvatarSizes size;

  const _DefaultAvatar({super.key, this.size = AvatarSizes.md});

  @override
  Widget build(BuildContext context) {
    final avatarTheme = AvatarTheme.maybeOf(context);
    final effectiveBackground = avatarTheme?.standard.background;
    final effectiveForeground = avatarTheme?.standard.foreground;
    final defaults = _AvatarDefaults.fromSize(size);

    return CircleAvatar(
      radius: defaults.radius,
      backgroundColor: effectiveBackground,
      foregroundColor: effectiveForeground,
      child: Icon(Icons.person_outline, size: defaults.iconSize),
    );
  }
}

final class _InitialsAvatar extends StatelessWidget {
  final String name;
  final AvatarSizes size;

  const _InitialsAvatar({
    super.key,
    required this.name,
    this.size = AvatarSizes.md,
  });

  String get _formattedName {
    final names = name.split(' ');

    if (names.length == 1) {
      return names.first.characters.first.toUpperCase();
    }

    return '${names.first.characters.first}${names.last.characters.first}'
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final avatarTheme = AvatarTheme.maybeOf(context);
    final effectiveBackground = avatarTheme?.initials.background;
    final effectiveForeground = avatarTheme?.initials.foreground;
    final defaults = _AvatarDefaults.fromSize(size);

    return SelectionContainer.disabled(
      child: CircleAvatar(
        radius: defaults.radius,
        backgroundColor: effectiveBackground,
        foregroundColor: effectiveForeground,
        child: Text(_formattedName, style: defaults.textStyle),
      ),
    );
  }
}

final class _ImageAvatar extends StatelessWidget {
  final ImageProvider<Object>? image;
  final AvatarSizes size;

  const _ImageAvatar({super.key, this.image, this.size = AvatarSizes.md});

  @override
  Widget build(BuildContext context) {
    final avatarTheme = AvatarTheme.maybeOf(context);
    final effectiveBackground = avatarTheme?.standard.background;
    final effectiveForeground = avatarTheme?.standard.foreground;
    final defaults = _AvatarDefaults.fromSize(size);

    return CircleAvatar(
      radius: defaults.radius,
      backgroundColor: effectiveBackground,
      foregroundColor: effectiveForeground,
      backgroundImage: image,
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
