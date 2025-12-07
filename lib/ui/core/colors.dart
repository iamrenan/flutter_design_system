import 'package:flutter/material.dart'
    as m
    show Color, ColorSwatch, MaterialColor;

/// Color palette used across the design system, whether by light or dark themes.
abstract class Colors {
  static const Color transparent = Color(0x00000000, {});

  static const Color white = Color(0xFFFFFFFF, {});

  static const Color black = Color(0xFF0A0A0A, {});

  static const int _indigoBase = 0xFF0031AE;
  static const Color indigo = Color(
    _indigoBase, // base
    <int, m.Color>{
      25: m.Color(0xFFF3F6FF),
      50: m.Color(0xFFDCE5FC),
      100: m.Color(0xFFABC3FF),
      200: m.Color(0xFF81A4FF),
      300: m.Color(0xFF5786FF),
      400: m.Color(0xFF2D68FF),
      500: m.Color(0xFF034AFF),
      600: m.Color(0xFF003DD8),
      700: m.Color(_indigoBase),
      800: m.Color(0xFF002789),
      900: m.Color(0xFF001C64),
      950: m.Color(0xFF00123F),
    },
  );

  static const _neutralBase = 0xFF737373;
  static const Color neutral = Color(_neutralBase, <int, m.Color>{
    100: m.Color(0xFFF5F5F5),
    200: m.Color(0xFFE5E5E5),
    300: m.Color(0xFFD4D4D4),
    400: m.Color(0xFFA3A3A3),
    500: m.Color(_neutralBase),
    600: m.Color(0xFF525252),
    700: m.Color(0xFF404040),
    800: m.Color(0xFF262626),
    900: m.Color(0xFF171717),
    950: m.Color(0xFF0A0A0A),
  });

  static const _greenBase = 0xFF0EC397;
  static const Color green = Color(_greenBase, <int, m.Color>{
    100: m.Color(0xFFD0FCF1),
    200: m.Color(0xFFA1F8E3),
    300: m.Color(0xFF73F5D5),
    400: m.Color(0xFF44F2C7),
    500: m.Color(0xFF15EEB9),
    600: m.Color(_greenBase),
    700: m.Color(0xFF0CA681),
    800: m.Color(0xFF0A8A6B),
    900: m.Color(0xFF086D55),
    950: m.Color(0xFF06513F),
  });

  static const _orangeBase = 0xFFFF9447;
  static const Color orange = Color(_orangeBase, <int, m.Color>{
    100: m.Color(0xFFFFE4D1),
    200: m.Color(0xFFFFCAA3),
    300: m.Color(0xFFFFAF75),
    400: m.Color(_orangeBase),
    500: m.Color(0xFFFF7E21),
    600: m.Color(0xFFFB6900),
    700: m.Color(0xFFD55900),
    800: m.Color(0xFFB04A00),
    900: m.Color(0xFF8A3A00),
    950: m.Color(0xFF652A00),
  });

  static const _redBase = 0xFFFB3748;
  static const Color red = Color(_redBase, <int, m.Color>{
    100: m.Color(0xFFFED7DA),
    200: m.Color(0xFFFDAFB6),
    300: m.Color(0xFFFD8791),
    400: m.Color(0xFFFC5F6D),
    500: m.Color(_redBase),
    600: m.Color(0xFFFA1024),
    700: m.Color(0xFFDD0417),
    800: m.Color(0xFFB60413),
    900: m.Color(0xFF8F030F),
    950: m.Color(0xFF68020B),
  });

  static const _violetBase = 0xFF7717FF;
  static const Color violet = Color(_violetBase, <int, m.Color>{
    100: m.Color(0xFFE2CEFF),
    200: m.Color(0xFFC69DFF),
    300: m.Color(0xFFA96CFF),
    400: m.Color(0xFF8C3BFF),
    500: m.Color(_violetBase),
    600: m.Color(0xFF6400F2),
    700: m.Color(0xFF5500CE),
    800: m.Color(0xFF4600AA),
    900: m.Color(0xFF370086),
    950: m.Color(0xFF280062),
  });

  static const _blueBase = 0xFF2864FF;
  static const Color blue = Color(_blueBase, <int, m.Color>{
    100: m.Color(0xFFD4E0FF),
    200: m.Color(0xFFA9C1FF),
    300: m.Color(0xFF7EA2FF),
    400: m.Color(0xFF5383FF),
    500: m.Color(_blueBase),
    600: m.Color(0xFF0248FF),
    700: m.Color(0xFF003DDA),
    800: m.Color(0xFF0032B3),
    900: m.Color(0xFF00278D),
    950: m.Color(0xFF001D66),
  });

  /// Colors based from primary (developer defined), rainbow spectrum and neutrals.
  static const Map<String, Color> all = {
    'primary': indigo,
    'indigo': indigo,
    'red': red,
    'orange': orange,
    'green': green,
    'blue': blue,
    'violet': violet,
    'neutral': neutral,
    'black': Color(0xFF0A0A0A, {}),
    'white': Color(0xFFFFFFFF, {}),
    'transparent': Color(0x00000000, {}),
  };
}

/// Based from [m.MaterialColor]
final class Color extends m.ColorSwatch<int> {
  const Color(super.primary, super.swatch);

  m.Color call(int shade) => this[shade]!;

  m.ColorSwatch<int> get swatch => this;

  /// The base shade.
  m.Color get base => m.Color.from(alpha: a, red: r, green: g, blue: b);

  /// The lightest shade.
  m.Color get shade25 =>
      this[25] ?? this[50] ?? this[100] ?? super.withValues();

  /// The second lightest shade.
  m.Color get shade50 => this[50] ?? this[100] ?? super.withValues();

  /// The third lightest shade.
  m.Color get shade100 => this[100] ?? super.withValues();

  /// The fourth lightest shade.
  m.Color get shade200 => this[200] ?? super.withValues();

  /// The fifth lightest shade.
  m.Color get shade300 => this[300] ?? super.withValues();

  /// The sixth lightest shade.
  m.Color get shade400 => this[400] ?? super.withValues();

  /// The default shade.
  m.Color get shade500 => this[500] ?? super.withValues();

  /// The fifth darkest shade.
  m.Color get shade600 => this[600] ?? super.withValues();

  /// The fourth darkest shade.
  m.Color get shade700 => this[700] ?? super.withValues();

  /// The third darkest shade.
  m.Color get shade800 => this[800] ?? super.withValues();

  /// The second darkest shade.
  m.Color get shade900 => this[900] ?? super.withValues();

  /// The darkest shade.
  m.Color get shade950 => this[950] ?? super.withValues();
}

extension ColorExtension on m.Color {
  /// Get a constrast color based on the luminance of this color. If
  /// the luminance is bigger than 0.5, [darkColor] is used, otherwise
  /// [lightColor] is used.
  ///
  /// This is usually used to constrast text colors with the background.
  m.Color basedOnLuminance({
    m.Color darkColor = Colors.black,
    m.Color lightColor = Colors.white,
  }) {
    return computeLuminance() < 0.5 ? lightColor : darkColor;
  }
}
