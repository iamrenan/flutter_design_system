import 'package:flutter/material.dart' show CircleAvatar, Icons;
import 'package:flutter/widget_previews.dart';
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

@Preview(
  name: 'Default Avatar - Small',
  group: 'Avatar Sizes',
  size: Size(100, 100),
)
Widget previewDefaultSmall() {
  return const Center(child: Avatar(size: AvatarSizes.sm));
}

@Preview(
  name: 'Default Avatar - Medium',
  group: 'Avatar Sizes',
  size: Size(100, 100),
)
Widget previewDefaultMedium() {
  return const Center(child: Avatar(size: AvatarSizes.md));
}

@Preview(
  name: 'Default Avatar - Large',
  group: 'Avatar Sizes',
  size: Size(100, 100),
)
Widget previewDefaultLarge() {
  return const Center(child: Avatar(size: AvatarSizes.lg));
}

@Preview(
  name: 'Initials Avatar - Single Name (Small)',
  group: 'Avatar Initials',
  size: Size(100, 100),
)
Widget previewInitialsSingleSmall() {
  return const Center(
    child: Avatar(name: 'Renan', size: AvatarSizes.sm),
  );
}

@Preview(
  name: 'Initials Avatar - Single Name (Medium)',
  group: 'Avatar Initials',
  size: Size(100, 100),
)
Widget previewInitialsSingleMedium() {
  return const Center(
    child: Avatar(name: 'Renan', size: AvatarSizes.md),
  );
}

@Preview(
  name: 'Initials Avatar - Single Name (Large)',
  group: 'Avatar Initials',
  size: Size(100, 100),
)
Widget previewInitialsSingleLarge() {
  return const Center(
    child: Avatar(name: 'Renan', size: AvatarSizes.lg),
  );
}

@Preview(
  name: 'Initials Avatar - Full Name (Small)',
  group: 'Avatar Initials',
  size: Size(100, 100),
)
Widget previewInitialsFullSmall() {
  return const Center(
    child: Avatar(name: 'Renan Silva', size: AvatarSizes.sm),
  );
}

@Preview(
  name: 'Initials Avatar - Full Name (Medium)',
  group: 'Avatar Initials',
  size: Size(100, 100),
)
Widget previewInitialsFullMedium() {
  return const Center(
    child: Avatar(name: 'Renan Silva', size: AvatarSizes.md),
  );
}

@Preview(
  name: 'Initials Avatar - Full Name (Large)',
  group: 'Avatar Initials',
  size: Size(100, 100),
)
Widget previewInitialsFullLarge() {
  return const Center(
    child: Avatar(name: 'Renan Silva', size: AvatarSizes.lg),
  );
}

@Preview(
  name: 'Image Avatar - Small',
  group: 'Avatar Images',
  size: Size(100, 100),
)
Widget previewImageSmall() {
  return const Center(
    child: Avatar(
      image: NetworkImage(
        'https://avatars.githubusercontent.com/u/8487664?v=4&size=64',
      ),
      size: AvatarSizes.sm,
    ),
  );
}

@Preview(
  name: 'Image Avatar - Medium',
  group: 'Avatar Images',
  size: Size(100, 100),
)
Widget previewImageMedium() {
  return const Center(
    child: Avatar(
      image: NetworkImage(
        'https://avatars.githubusercontent.com/u/8487664?v=4&size=64',
      ),
      size: AvatarSizes.md,
    ),
  );
}

@Preview(
  name: 'Image Avatar - Large',
  group: 'Avatar Images',
  size: Size(100, 100),
)
Widget previewImageLarge() {
  return const Center(
    child: Avatar(
      image: NetworkImage(
        'https://avatars.githubusercontent.com/u/8487664?v=4&size=64',
      ),
      size: AvatarSizes.lg,
    ),
  );
}

@Preview(
  name: 'All Sizes Comparison',
  group: 'Avatar Showcase',
  size: Size(300, 150),
)
Widget previewAllSizes() {
  return const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Avatar(size: AvatarSizes.sm, name: 'Small'),
        Avatar(size: AvatarSizes.md, name: 'Medium'),
        Avatar(size: AvatarSizes.lg, name: 'Large'),
      ],
    ),
  );
}

@Preview(
  name: 'All Variants Comparison',
  group: 'Avatar Showcase',
  size: Size(300, 150),
)
Widget previewAllVariants() {
  return const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Avatar(size: AvatarSizes.md),
        Avatar(size: AvatarSizes.md, name: 'John Doe'),
        Avatar(
          size: AvatarSizes.md,
          image: NetworkImage(
            'https://avatars.githubusercontent.com/u/8487664?v=4&size=64',
          ),
        ),
      ],
    ),
  );
}
