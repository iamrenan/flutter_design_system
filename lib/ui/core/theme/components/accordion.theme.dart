import 'package:flutter/material.dart' hide Radius, Colors;

import '../../radius.dart';
import '../../spacing.dart';
import '../../text_styles.dart';
import '../tokens/accordion.dart';

final class AccordionTheme extends InheritedTheme {
  final AccordionThemeData data;

  const AccordionTheme({super.key, required this.data, required super.child});

  static AccordionThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AccordionTheme>()?.data ??
        Theme.of(context).extension<AccordionThemeData>();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AccordionTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AccordionTheme oldWidget) => data != oldWidget.data;
}

final class AccordionOutlinedThemeData {
  final Color? titleColor;
  final Color? textColor;
  final Color? iconColor;

  const AccordionOutlinedThemeData({
    this.titleColor,
    this.textColor,
    this.iconColor,
  });

  factory AccordionOutlinedThemeData.fromTokens(
    AccordionOutlinedTokens outlined,
  ) {
    return AccordionOutlinedThemeData(
      titleColor: outlined.title,
      textColor: outlined.text,
      iconColor: outlined.icon,
    );
  }
}

final class AccordionFlatThemeData {
  final Color? titleColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? background;

  const AccordionFlatThemeData({
    this.titleColor,
    this.textColor,
    this.iconColor,
    this.background,
  });

  factory AccordionFlatThemeData.fromTokens(AccordionFlatTokens flat) {
    return AccordionFlatThemeData(
      titleColor: flat.title,
      textColor: flat.text,
      iconColor: flat.icon,
      background: flat.background,
    );
  }
}

final class AccordionThemeData extends ThemeExtension<AccordionThemeData> {
  final AccordionOutlinedThemeData outlined;
  final AccordionFlatThemeData flat;

  const AccordionThemeData({required this.outlined, required this.flat});

  factory AccordionThemeData.fromTokens(AccordionTokens accordion) {
    return AccordionThemeData(
      outlined: AccordionOutlinedThemeData.fromTokens(accordion.outlined),
      flat: AccordionFlatThemeData.fromTokens(accordion.flat),
    );
  }

  factory AccordionThemeData.light() {
    return AccordionThemeData.fromTokens(LightAccordionTokens());
  }

  factory AccordionThemeData.dark() {
    return AccordionThemeData.fromTokens(DarkAccordionTokens());
  }

  @override
  ThemeExtension<AccordionThemeData> copyWith({
    AccordionOutlinedThemeData? outlined,
    AccordionFlatThemeData? flat,
  }) {
    return AccordionThemeData(
      outlined: outlined ?? this.outlined,
      flat: flat ?? this.flat,
    );
  }

  @override
  ThemeExtension<AccordionThemeData> lerp(
    covariant ThemeExtension<AccordionThemeData>? other,
    double t,
  ) {
    if (other is! AccordionThemeData) return this;

    return AccordionThemeData(
      outlined: AccordionOutlinedThemeData(
        titleColor: Color.lerp(
          outlined.titleColor,
          other.outlined.titleColor,
          t,
        ),
        textColor: Color.lerp(outlined.textColor, other.outlined.textColor, t),
        iconColor: Color.lerp(outlined.iconColor, other.outlined.iconColor, t),
      ),
      flat: AccordionFlatThemeData(
        titleColor: Color.lerp(flat.titleColor, other.flat.titleColor, t),
        textColor: Color.lerp(flat.textColor, other.flat.textColor, t),
        iconColor: Color.lerp(flat.iconColor, other.flat.iconColor, t),
        background: Color.lerp(flat.background, other.flat.background, t),
      ),
    );
  }
}

enum AccordionVariants {
  outlined,
  flat;

  EdgeInsets get padding => switch (this) {
    AccordionVariants.outlined => EdgeInsets.symmetric(
      vertical: Spacing.spacing16,
    ),
    AccordionVariants.flat => EdgeInsets.symmetric(
      vertical: Spacing.spacing16,
      horizontal: Spacing.spacing24,
    ),
  };

  BorderRadius get borderRadius {
    return switch (this) {
      AccordionVariants.outlined => Radius.radius0,
      AccordionVariants.flat => Radius.radius6,
    };
  }

  TextStyle titleStyle(BuildContext context) {
    final theme = AccordionTheme.maybeOf(context);
    final defaultTextStyle = TextStyles.bodyMedium;
    return switch (this) {
      AccordionVariants.outlined => defaultTextStyle.copyWith(
        color: theme?.outlined.titleColor,
      ),
      AccordionVariants.flat => defaultTextStyle.copyWith(
        color: theme?.flat.titleColor,
      ),
    };
  }

  TextStyle textStyle(BuildContext context) {
    final theme = AccordionTheme.maybeOf(context);
    final defaultTextStyle = TextStyles.bodySmall;
    return switch (this) {
      AccordionVariants.outlined => defaultTextStyle.copyWith(
        color: theme?.outlined.textColor,
      ),
      AccordionVariants.flat => defaultTextStyle.copyWith(
        color: theme?.flat.textColor,
      ),
    };
  }

  Color? background(BuildContext context) {
    final theme = AccordionTheme.maybeOf(context);
    return switch (this) {
      AccordionVariants.outlined => null,
      AccordionVariants.flat =>
        theme?.flat.background ??
            Theme.of(context).colorScheme.surfaceContainerLow,
    };
  }

  Color? titleColor(BuildContext context) {
    final theme = AccordionTheme.maybeOf(context);
    return switch (this) {
      AccordionVariants.outlined => theme?.outlined.titleColor,
      AccordionVariants.flat => theme?.flat.titleColor,
    };
  }

  Color? textColor(BuildContext context) {
    final theme = AccordionTheme.maybeOf(context);
    return switch (this) {
      AccordionVariants.outlined => theme?.outlined.textColor,
      AccordionVariants.flat => theme?.flat.textColor,
    };
  }

  Color? iconColor(BuildContext context) {
    final theme = AccordionTheme.maybeOf(context);
    return switch (this) {
      AccordionVariants.outlined => theme?.outlined.iconColor,
      AccordionVariants.flat => theme?.flat.iconColor,
    };
  }
}
