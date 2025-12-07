/// Defines standard icon sizes to be used by the components.
abstract class IconSize {
  /// 12
  static const double xs = 12.0;

  /// 16
  static const double sm = 16.0;

  /// 20
  static const double md = 20.0;

  /// 24
  static const double lg = 24.0;

  /// 32
  static const double xl = 32.0;
}

enum IconSizes {
  xs(IconSize.xs),
  sm(IconSize.sm),
  md(IconSize.md),
  lg(IconSize.lg),
  xl(IconSize.xl);

  final double dimension;

  const IconSizes(this.dimension);
}
