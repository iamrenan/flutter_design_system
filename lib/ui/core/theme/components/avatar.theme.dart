import 'package:flutter/material.dart';

import '../tokens/avatar.dart';

final class AvatarTheme extends InheritedTheme {
  final AvatarThemeData data;

  const AvatarTheme({super.key, required this.data, required super.child});

  static AvatarThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AvatarTheme>()?.data ??
        Theme.of(context).extension<AvatarThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AvatarTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AvatarTheme oldWidget) => data != oldWidget.data;
}

final class AvatarDefaultThemeData {
  final Color? background;
  final Color? foreground;

  const AvatarDefaultThemeData({this.background, this.foreground});

  factory AvatarDefaultThemeData.fromTokens(AvatarDefaultTokens standard) {
    return AvatarDefaultThemeData(
      background: standard.background,
      foreground: standard.icon,
    );
  }
}

final class AvatarInitialsThemeData {
  final Color? background;
  final Color? foreground;

  const AvatarInitialsThemeData({this.background, this.foreground});

  factory AvatarInitialsThemeData.fromTokens(AvatarInitialsTokens initials) {
    return AvatarInitialsThemeData(
      background: initials.background,
      foreground: initials.text,
    );
  }
}

final class AvatarThemeData extends ThemeExtension<AvatarThemeData> {
  final AvatarDefaultThemeData standard;
  final AvatarInitialsThemeData initials;

  const AvatarThemeData({required this.standard, required this.initials});

  factory AvatarThemeData.fromTokens(AvatarTokens avatar) {
    return AvatarThemeData(
      standard: AvatarDefaultThemeData.fromTokens(avatar.standard),
      initials: AvatarInitialsThemeData.fromTokens(avatar.initials),
    );
  }

  factory AvatarThemeData.light() {
    return AvatarThemeData.fromTokens(LightAvatarTokens());
  }

  factory AvatarThemeData.dark() {
    return AvatarThemeData.fromTokens(DarkAvatarTokens());
  }

  @override
  ThemeExtension<AvatarThemeData> copyWith({
    AvatarDefaultThemeData? standard,
    AvatarInitialsThemeData? initials,
  }) {
    return AvatarThemeData(
      standard: standard ?? this.standard,
      initials: initials ?? this.initials,
    );
  }

  @override
  ThemeExtension<AvatarThemeData> lerp(
    covariant ThemeExtension<AvatarThemeData>? other,
    double t,
  ) {
    if (other is! AvatarThemeData) return this;

    return AvatarThemeData(
      standard: AvatarDefaultThemeData(
        background: Color.lerp(
          standard.background,
          other.standard.background,
          t,
        ),
        foreground: Color.lerp(
          standard.foreground,
          other.standard.foreground,
          t,
        ),
      ),
      initials: AvatarInitialsThemeData(
        background: Color.lerp(
          initials.background,
          other.initials.background,
          t,
        ),
        foreground: Color.lerp(
          initials.foreground,
          other.initials.foreground,
          t,
        ),
      ),
    );
  }
}
