import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'spinner.dart';

final class SpinnerPreview extends Preview {
  const SpinnerPreview({
    super.name,
    super.group,
    super.textScaleFactor,
    super.wrapper,
    super.brightness,
    super.localizations,
    super.size,
  }) : super(theme: SpinnerPreview.themeBuilder);

  static PreviewThemeData themeBuilder() {
    return PreviewThemeData(
      materialLight: ThemeData.light(),
      materialDark: ThemeData.dark(),
    );
  }
}

@SpinnerPreview(group: 'Spinner Sizes', name: 'Small', size: Size.square(64))
Widget spinnerSmallPreview() => Spinner(size: SpinnerSize.sm);

@SpinnerPreview(group: 'Spinner Sizes', name: 'Medium', size: Size.square(64))
Widget spinnerMediumPreview() => Spinner(size: SpinnerSize.md);

@SpinnerPreview(group: 'Spinner Sizes', name: 'Large', size: Size.square(64))
Widget spinnerLargePreview() => Spinner(size: SpinnerSize.lg);

@SpinnerPreview(
  group: 'Spinner Sizes',
  name: 'Extra Large',
  size: Size.square(64),
)
Widget spinnerExtraLargePreview() => Spinner(size: SpinnerSize.xl);

@SpinnerPreview(group: 'Spinner Colors', name: 'Red', size: Size.square(32))
Widget spinnerRedPreview() => Spinner(color: Colors.red);

@SpinnerPreview(group: 'Spinner Colors', name: 'Green', size: Size.square(32))
Widget spinnerGreenPreview() => Spinner(color: Colors.green);

@SpinnerPreview(group: 'Spinner Colors', name: 'Blue', size: Size.square(32))
Widget spinnerBluePreview() => Spinner(color: Colors.blue);

@SpinnerPreview(group: 'Spinner Values', name: '0 or 1', size: Size.square(64))
Widget spinnerValueZeroPreview() => Spinner(size: SpinnerSize.sm, value: 0);

@SpinnerPreview(group: 'Spinner Values', name: '0.25', size: Size.square(64))
Widget spinnerValueQuarterPreview() =>
    Spinner(size: SpinnerSize.sm, value: 0.25);

@SpinnerPreview(group: 'Spinner Values', name: '0.5', size: Size.square(64))
Widget spinnerValueHalfPreview() => Spinner(size: SpinnerSize.sm, value: 0.5);

@SpinnerPreview(group: 'Spinner Values', name: '0.75', size: Size.square(64))
Widget spinnerValueThreeQuarterPreview() =>
    Spinner(size: SpinnerSize.sm, value: 0.75);
