import 'package:flutter/widgets.dart';

final class FontFamily {
  static const String sourceSansProFontFamily = 'SourceSansPro';
}

final class TextStyles {
  const TextStyles._();

  // Display styles (largest, most prominent)
  /// 36px, 600w, 42/36
  static TextStyle get displayLarge => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w600,
    fontVariations: [FontVariation.weight(600)],
    height: 42 / 36,
    letterSpacing: 0,
  );

  /// 32px, 600w, 40/32
  static TextStyle get displayMedium => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontVariations: [FontVariation.weight(600)],
    height: 40 / 32,
    letterSpacing: 0,
  );

  /// 28px, 600w, 36/28
  static TextStyle get displaySmall => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontVariations: [FontVariation.weight(600)],
    height: 36 / 28,
    letterSpacing: 0,
  );

  // Headline styles (high-emphasis, shorter text)
  /// 24px, 600w, 32/24
  static TextStyle get headlineLarge => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontVariations: [FontVariation.weight(600)],
    height: 32 / 24,
    letterSpacing: 0,
  );

  /// 20px, 600w, 28/20
  static TextStyle get headlineMedium => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontVariations: [FontVariation.weight(600)],
    height: 28 / 20,
    letterSpacing: 0,
  );

  /// 18px, 600w, 28/18
  static TextStyle get headlineSmall => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontVariations: [FontVariation.weight(600)],
    height: 28 / 18,
    letterSpacing: 0,
  );

  // Title styles (medium-emphasis)
  /// 24px, 400w, 32/24
  static TextStyle get titleLarge => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 32 / 24,
    letterSpacing: 0,
  );

  /// 20px, 400w, 28/20
  static TextStyle get titleMedium => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 28 / 20,
    letterSpacing: 0,
  );

  /// 18px, 400w, 28/18
  static TextStyle get titleSmall => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 28 / 18,
    letterSpacing: 0,
  );

  // Body styles (default text)
  /// 18px, 400w, 28/18
  static TextStyle get bodyLarge => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 28 / 18,
    letterSpacing: 0,
  );

  /// 16px, 400w, 24/16
  static TextStyle get bodyMedium => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 24 / 16,
    letterSpacing: 0,
  );

  /// 14px, 400w, 22/14
  static TextStyle get bodySmall => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 22 / 14,
    letterSpacing: 0,
  );

  // Label styles (smaller text for UI elements)
  /// 14px, 400w, 22/14
  static TextStyle get labelLarge => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 22 / 14,
    letterSpacing: 0,
  );

  /// 12px, 400w, 16/12
  static TextStyle get labelMedium => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 16 / 12,
    letterSpacing: 0,
  );

  /// 12px, 400w, 16/12
  static TextStyle get labelSmall => const TextStyle(
    fontFamily: FontFamily.sourceSansProFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontVariations: [FontVariation.weight(400)],
    height: 16 / 12,
    letterSpacing: 0,
  );
}
