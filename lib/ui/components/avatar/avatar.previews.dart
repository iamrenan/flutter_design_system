import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'avatar.dart';

const String _previewAvatarImageUrl =
    'https://avatars.githubusercontent.com/u/8487664?v=4&size=64';

final class AvatarPreview extends Preview {
  const AvatarPreview({
    super.name,
    super.group,
    super.textScaleFactor,
    super.wrapper,
    super.brightness,
    super.localizations,
    super.size,
  }) : super(theme: AvatarPreview.themeBuilder);

  static PreviewThemeData themeBuilder() {
    return PreviewThemeData(
      materialLight: ThemeData.light(),
      materialDark: ThemeData.dark(),
    );
  }

  @override
  Preview transform() {
    final builder = super.transform().toBuilder()
      ..size = size ?? const Size.square(32)
      ..wrapper = (child) => Center(child: child);

    return builder.build();
  }
}

@AvatarPreview(
  name: 'All Variants and Sizes Comparison',
  group: 'Avatar Showcase',
  size: Size(300, 150),
)
Widget previewAllVariants() {
  return Column(
    spacing: 24,
    children: AvatarSizes.values
        .map(
          (size) => Row(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Avatar(size: size),
              Avatar(size: size, name: 'John Doe'),
              Avatar(size: size, image: NetworkImage(_previewAvatarImageUrl)),
            ],
          ),
        )
        .toList(),
  );
}

@AvatarPreview(name: 'Small', group: 'Avatar Sizes')
Widget previewDefaultSmall() => Avatar(size: AvatarSizes.size10);

@AvatarPreview(name: 'Medium', group: 'Avatar Sizes')
Widget previewDefaultMedium() => Avatar(size: AvatarSizes.size12);

@AvatarPreview(name: 'Large', group: 'Avatar Sizes')
Widget previewDefaultLarge() => Avatar(size: AvatarSizes.size16);

@AvatarPreview(name: 'Single Name (Small)', group: 'Avatar Initials')
Widget previewInitialsSingleSmall() =>
    Avatar(name: 'Renan', size: AvatarSizes.size10);

@AvatarPreview(name: 'Single Name (Medium)', group: 'Avatar Initials')
Widget previewInitialsSingleMedium() =>
    Avatar(name: 'Renan', size: AvatarSizes.size12);

@AvatarPreview(name: 'Single Name (Large)', group: 'Avatar Initials')
Widget previewInitialsSingleLarge() =>
    Avatar(name: 'Renan', size: AvatarSizes.size16);

@AvatarPreview(name: 'Full Name (Small)', group: 'Avatar Initials')
Widget previewInitialsFullSmall() =>
    Avatar(name: 'Renan Aguiar', size: AvatarSizes.size10);

@AvatarPreview(name: 'Full Name (Medium)', group: 'Avatar Initials')
Widget previewInitialsFullMedium() =>
    Avatar(name: 'Renan Aguiar', size: AvatarSizes.size12);

@AvatarPreview(name: 'Full Name (Large)', group: 'Avatar Initials')
Widget previewInitialsFullLarge() =>
    Avatar(name: 'Renan Aguiar', size: AvatarSizes.size16);

@AvatarPreview(name: 'Long name', group: 'Avatar Initials')
Widget previewInitialsLongName() =>
    Avatar(name: 'Uses first and last initials only', size: AvatarSizes.size16);

@AvatarPreview(name: 'Empty name', group: 'Avatar Initials')
Widget previewInitialsEmptyName() => Avatar(name: '', size: AvatarSizes.size16);

@AvatarPreview(name: 'Image Avatar - Small', group: 'Avatar Images')
Widget previewImageSmall() => Avatar(
  image: NetworkImage(_previewAvatarImageUrl),
  size: AvatarSizes.size10,
);

@AvatarPreview(name: 'Image Avatar - Medium', group: 'Avatar Images')
Widget previewImageMedium() => Avatar(
  image: NetworkImage(_previewAvatarImageUrl),
  size: AvatarSizes.size12,
);

@AvatarPreview(name: 'Image Avatar - Large', group: 'Avatar Images')
Widget previewImageLarge() => Avatar(
  image: NetworkImage(_previewAvatarImageUrl),
  size: AvatarSizes.size16,
);
