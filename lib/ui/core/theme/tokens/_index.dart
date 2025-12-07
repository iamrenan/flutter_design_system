import 'avatar.dart';
export 'avatar.dart';

abstract interface class ColorTokens {
  AvatarTokens get avatar;
}

final class LightColorTokens implements ColorTokens {
  @override
  AvatarTokens get avatar => LightAvatarTokens();
}

final class DarkColorTokens implements ColorTokens {
  @override
  AvatarTokens get avatar => DarkAvatarTokens();
}
