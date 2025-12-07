import 'package:flutter/widgets.dart';

final class FontFamily {
  static const String sourceSansProFontFamily = 'SourceSansPro';
}

final class TextStyles {
  const TextStyles._();

  /// 36px, 600w, 42/36
  static TextStyle get heading1 => TextStylesEnum.heading1.style;

  /// 32px, 600w, 40/32
  static TextStyle get heading2 => TextStylesEnum.heading2.style;

  /// 28px, 600w, 36/28
  static TextStyle get heading3 => TextStylesEnum.heading3.style;

  /// 24px, 600w, 32/24
  static TextStyle get heading4 => TextStylesEnum.heading4.style;

  /// 20px, 600w, 28/20
  static TextStyle get heading5 => TextStylesEnum.heading5.style;

  /// 18px, 600w, 28/18
  static TextStyle get heading6 => TextStylesEnum.heading6.style;

  /// 36px, 400w, 44/36
  static TextStyle get subtitle1 => TextStylesEnum.subtitle1.style;

  /// 32px, 400w, 40/32
  static TextStyle get subtitle2 => TextStylesEnum.subtitle2.style;

  /// 28px, 400w, 36/28
  static TextStyle get subtitle3 => TextStylesEnum.subtitle3.style;

  /// 24px, 400w, 32/24
  static TextStyle get subtitle4 => TextStylesEnum.subtitle4.style;

  /// 20px, 400w, 28/20
  static TextStyle get subtitle5 => TextStylesEnum.subtitle5.style;

  /// 18px, 400w, 28/18
  static TextStyle get subtitle6 => TextStylesEnum.subtitle6.style;

  /// 18px, 400w, 28/18
  static TextStyle get bodyLg => TextStylesEnum.bodyLg.style;

  /// 16px, 400w, 24/16
  static TextStyle get bodyMd => TextStylesEnum.bodyMd.style;

  /// 14px, 400w, 22/14
  static TextStyle get bodySm => TextStylesEnum.bodySm.style;

  /// 12px, 400w, 16/12
  static TextStyle get bodyXs => TextStylesEnum.bodyXs.style;
}

enum TextStylesEnum {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  subtitle1,
  subtitle2,
  subtitle3,
  subtitle4,
  subtitle5,
  subtitle6,
  bodyLg,
  bodyMd,
  bodySm,
  bodyXs;

  TextStyle get style {
    switch (this) {
      case TextStylesEnum.heading1:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 36,
          fontWeight: FontWeight.w600,
          fontVariations: [FontVariation.weight(600)],
          height: 42 / 36,
          letterSpacing: 0,
        );
      case TextStylesEnum.heading2:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          fontVariations: [FontVariation.weight(600)],
          height: 40 / 32,
          letterSpacing: 0,
        );
      case TextStylesEnum.heading3:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontVariations: [FontVariation.weight(600)],
          height: 36 / 28,
          letterSpacing: 0,
        );
      case TextStylesEnum.heading4:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontVariations: [FontVariation.weight(600)],
          height: 32 / 24,
          letterSpacing: 0,
        );
      case TextStylesEnum.heading5:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontVariations: [FontVariation.weight(600)],
          height: 28 / 20,
          letterSpacing: 0,
        );
      case TextStylesEnum.heading6:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontVariations: [FontVariation.weight(600)],
          height: 28 / 18,
          letterSpacing: 0,
        );
      case TextStylesEnum.subtitle1:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 36,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 44 / 36,
          letterSpacing: 0,
        );
      case TextStylesEnum.subtitle2:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 32,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 40 / 32,
          letterSpacing: 0,
        );
      case TextStylesEnum.subtitle3:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 28,
          fontWeight: FontWeight.w400,
          fontVariations: [FontVariation.weight(400)],
          height: 36 / 28,
          letterSpacing: 0,
        );
      case TextStylesEnum.subtitle4:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 32 / 24,
          letterSpacing: 0,
        );
      case TextStylesEnum.subtitle5:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 28 / 20,
          letterSpacing: 0,
        );
      case TextStylesEnum.subtitle6:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontVariations: [FontVariation.weight(400)],
          height: 28 / 18,
          letterSpacing: 0,
        );
      case TextStylesEnum.bodyLg:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 28 / 18,
          letterSpacing: 0,
        );
      case TextStylesEnum.bodyMd:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 24 / 16,
          letterSpacing: 0,
        );
      case TextStylesEnum.bodySm:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 22 / 14,
          letterSpacing: 0,
        );
      case TextStylesEnum.bodyXs:
        return TextStyle(
          fontFamily: FontFamily.sourceSansProFontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,

          fontVariations: [FontVariation.weight(400)],
          height: 16 / 12,
          letterSpacing: 0,
        );
    }
  }
}
