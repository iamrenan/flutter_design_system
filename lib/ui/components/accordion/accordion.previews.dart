import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../core/theme/components/accordion.theme.dart';
import 'accordion.dart';

final class AccordionPreview extends Preview {
  const AccordionPreview({
    super.name,
    super.group,
    super.textScaleFactor,
    super.wrapper,
    super.brightness,
    super.localizations,
    super.size,
  }) : super(theme: AccordionPreview.themeBuilder);

  static PreviewThemeData themeBuilder() {
    return PreviewThemeData(
      materialLight: ThemeData.light(),
      materialDark: ThemeData.dark(),
    );
  }

  @override
  Preview transform() {
    final builder = super.transform().toBuilder()
      ..size = size ?? const Size(400, 350)
      ..wrapper = (child) => Center(child: child);

    return builder.build();
  }
}

@AccordionPreview(name: 'Accordion - Flat Variant', group: 'Variants')
Widget previewFlatVariant() {
  return Accordion(
    title: 'What is Lorem Ipsum?',
    content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    variant: AccordionVariants.flat,
    initiallyExpanded: true,
  );
}

@AccordionPreview(name: 'Accordion - Outlined Variant', group: 'Variants')
Widget previewOutlinedVariant() {
  return Accordion(
    title: 'What is Lorem Ipsum?',
    content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    variant: AccordionVariants.outlined,
    initiallyExpanded: true,
  );
}
