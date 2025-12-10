import 'dart:ui';

import '../../colors.dart' hide Color;

abstract interface class AccordionTokens {
  AccordionOutlinedTokens get outlined;
  AccordionFlatTokens get flat;
}

abstract interface class AccordionOutlinedTokens {
  Color get title;
  Color get text;
  Color get icon;
}

abstract interface class AccordionFlatTokens {
  Color get title;
  Color get text;
  Color get icon;
  Color get background;
}

final class LightAccordionTokens implements AccordionTokens {
  @override
  AccordionOutlinedTokens get outlined => _LightAccordionOutlinedTokens();
  @override
  AccordionFlatTokens get flat => _LightAccordionFlatTokens();
}

final class _LightAccordionOutlinedTokens implements AccordionOutlinedTokens {
  @override
  Color get title => Colors.neutral.shade950;
  @override
  Color get text => Colors.neutral.shade600;
  @override
  Color get icon => Colors.blue.base;
}

final class _LightAccordionFlatTokens implements AccordionFlatTokens {
  @override
  Color get title => Colors.neutral.shade950;
  @override
  Color get text => Colors.neutral.shade600;
  @override
  Color get icon => Colors.blue.base;
  @override
  Color get background => Colors.neutral.shade100;
}

final class DarkAccordionTokens implements AccordionTokens {
  @override
  AccordionOutlinedTokens get outlined => _DarkAccordionOutlinedTokens();
  @override
  AccordionFlatTokens get flat => _DarkAccordionFlatTokens();
}

final class _DarkAccordionOutlinedTokens implements AccordionOutlinedTokens {
  @override
  Color get title => Colors.white.base;
  @override
  Color get text => Colors.neutral.shade100;
  @override
  Color get icon => Colors.blue.shade300;
}

final class _DarkAccordionFlatTokens implements AccordionFlatTokens {
  @override
  Color get title => Colors.white.base;
  @override
  Color get text => Colors.neutral.shade100;
  @override
  Color get icon => Colors.blue.shade300;
  @override
  Color get background => Colors.neutral.shade800;
}
