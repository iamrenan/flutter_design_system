import 'package:flutter/material.dart'
    hide
        Colors,
        CardThemeData,
        CheckboxThemeData,
        ButtonThemeData,
        TooltipThemeData,
        DatePickerThemeData;

import 'components/avatar.theme.dart';
import '../colors.dart';
import '../text_styles.dart';

ThemeData get lightTheme {
  return ThemeData(
    fontFamily: FontFamily.sourceSansProFontFamily,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    extensions: [AvatarThemeData.light()],
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.indigo,
      selectionColor: Colors.indigo.shade100,
      selectionHandleColor: Colors.indigo.shade500,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.indigo,
      onPrimary: Colors.white,
      secondary: Colors.orange,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.neutral.shade300,
      surfaceContainerHighest: Colors.neutral.shade200,
      inverseSurface: Colors.neutral.shade800,
      surfaceContainerLowest: Colors.neutral.shade100,
      surfaceContainerLow: Colors.neutral.shade200,
      surfaceContainer: Colors.neutral.shade300,
      surfaceContainerHigh: Colors.neutral.shade400,
      onSurface: Colors.neutral.shade800,
      onSurfaceVariant: Colors.neutral.shade600,
    ),
    disabledColor: Colors.neutral.shade300,
    focusColor: Colors.indigo,
    textTheme: TextTheme(
      displayLarge: TextStyles.heading1,
      displayMedium: TextStyles.heading2,
      displaySmall: TextStyles.heading3,
      headlineLarge: TextStyles.heading4,
      headlineMedium: TextStyles.heading5,
      headlineSmall: TextStyles.heading6,
      labelLarge: TextStyles.bodyLg,
      labelMedium: TextStyles.bodyMd,
      labelSmall: TextStyles.bodySm,
      bodyLarge: TextStyles.bodyLg,
      bodyMedium: TextStyles.bodyMd,
      bodySmall: TextStyles.bodySm,
    ),
    scrollbarTheme: ScrollbarThemeData(
      radius: Radius.circular(999),
      thickness: WidgetStatePropertyAll(8.0),
      trackColor: WidgetStatePropertyAll(Colors.neutral.shade100),
      thumbColor: WidgetStatePropertyAll(Colors.neutral.shade700),
      thumbVisibility: WidgetStatePropertyAll(true),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.indigo.shade200,
      linearTrackColor: Colors.neutral.shade100,
      borderRadius: BorderRadius.zero,
      stopIndicatorColor: Colors.red.shade500,
      stopIndicatorRadius: 8.0,
      trackGap: 8.0,
      linearMinHeight: 16,
    ),
    dividerColor: Colors.neutral.shade300,
  );
}

ThemeData get darkTheme {
  return ThemeData(
    fontFamily: FontFamily.sourceSansProFontFamily,
    brightness: Brightness.dark,
    platform: TargetPlatform.iOS,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.indigo,
      selectionColor: Colors.indigo.shade100,
      selectionHandleColor: Colors.indigo.shade500,
    ),
    extensions: [AvatarThemeData.dark()],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.indigo,
      onPrimary: Colors.white,
      secondary: Colors.orange,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,

      surface: Colors.neutral.shade300,
      surfaceContainerHighest: Colors.neutral.shade200,
      inverseSurface: Colors.neutral.shade800,

      surfaceContainerLowest: Colors.neutral.shade900,
      surfaceContainerLow: Colors.neutral.shade800,
      surfaceContainer: Colors.neutral.shade700,
      surfaceContainerHigh: Colors.neutral.shade600,
      onSurface: Colors.white,
      onSurfaceVariant: Colors.neutral.shade300,
    ),
    disabledColor: Colors.neutral.shade800,
    focusColor: Colors.indigo,
    textTheme: TextTheme(
      displayLarge: TextStyles.heading1,
      displayMedium: TextStyles.heading2,
      displaySmall: TextStyles.heading3,
      headlineLarge: TextStyles.heading4,
      headlineMedium: TextStyles.heading5,
      headlineSmall: TextStyles.heading6,
      labelLarge: TextStyles.bodyLg,
      labelMedium: TextStyles.bodyMd,
      labelSmall: TextStyles.bodySm,
      bodyLarge: TextStyles.bodyLg,
      bodyMedium: TextStyles.bodyMd,
      bodySmall: TextStyles.bodySm,
    ),
    scrollbarTheme: ScrollbarThemeData(
      radius: Radius.circular(999),
      thickness: WidgetStatePropertyAll(8.0),
      trackColor: WidgetStatePropertyAll(Colors.neutral.shade700),
      thumbColor: WidgetStatePropertyAll(Colors.neutral.shade100),
      thumbVisibility: WidgetStatePropertyAll(true),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.indigo.shade800,
      linearTrackColor: Colors.neutral.shade900,
      borderRadius: BorderRadius.zero,
      stopIndicatorRadius: 8.0,
      trackGap: 2.0,
      linearMinHeight: 12,
    ),
    inputDecorationTheme: InputDecorationTheme(labelStyle: TextStyles.bodyMd),
    dividerColor: Colors.neutral.shade700,
  );
}
