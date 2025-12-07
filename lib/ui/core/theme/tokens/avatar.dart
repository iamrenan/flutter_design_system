import 'dart:ui';
import '../../colors.dart' hide Color;

abstract interface class AvatarTokens {
  AvatarDefaultTokens get standard;

  AvatarInitialsTokens get initials;
}

abstract interface class AvatarDefaultTokens {
  Color get background;

  Color get icon;
}

abstract interface class AvatarInitialsTokens {
  Color get background;

  Color get text;
}

final class LightAvatarTokens implements AvatarTokens {
  @override
  AvatarDefaultTokens get standard => _LightAvatarDefaultTokens();

  @override
  AvatarInitialsTokens get initials => _LightAvatarInitialsTokens();
}

final class _LightAvatarDefaultTokens implements AvatarDefaultTokens {
  @override
  Color get background => Colors.neutral.shade100;

  @override
  Color get icon => Colors.neutral.shade600;
}

final class _LightAvatarInitialsTokens implements AvatarInitialsTokens {
  @override
  Color get background => Colors.indigo.shade50;

  @override
  Color get text => Colors.indigo.shade700;
}

final class DarkAvatarTokens implements AvatarTokens {
  @override
  AvatarDefaultTokens get standard => _DarkAvatarDefaultTokens();

  @override
  AvatarInitialsTokens get initials => _DarkAvatarInitialsTokens();
}

final class _DarkAvatarDefaultTokens implements AvatarDefaultTokens {
  @override
  Color get background => Colors.neutral.shade950;

  @override
  Color get icon => Colors.neutral.shade400;
}

final class _DarkAvatarInitialsTokens implements AvatarInitialsTokens {
  @override
  Color get background => Colors.neutral.shade800;

  @override
  Color get text => Colors.neutral.shade100;
}
