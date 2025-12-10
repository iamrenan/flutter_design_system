import 'package:flutter/material.dart' as m show Radius, BorderRadius;

enum RadiusEnum {
  /// 0
  none(Radius.none),

  /// 2
  xxs(Radius.xxs),

  /// 4
  xs(Radius.xs),

  /// 6
  sm(Radius.sm),

  /// 8
  md(Radius.md),

  /// 10
  lg(Radius.lg),

  /// 12
  xl(Radius.xl),

  /// 14
  xl2(Radius.xl2),

  /// 16
  xl3(Radius.xl3),

  /// 24
  xl4(Radius.xl4),

  /// 32
  xl5(Radius.xl5),

  /// 999
  full(Radius.full);

  final m.BorderRadius borderRadius;

  const RadiusEnum(this.borderRadius);
}

final class Radius {
  const Radius._();

  /// 0
  static const m.BorderRadius none = m.BorderRadius.zero;

  /// 2
  static const m.BorderRadius xxs = m.BorderRadius.all(m.Radius.circular(2));

  /// 4
  static const m.BorderRadius xs = m.BorderRadius.all(m.Radius.circular(4));

  /// 6
  static const m.BorderRadius sm = m.BorderRadius.all(m.Radius.circular(6));

  /// 8
  static const m.BorderRadius md = m.BorderRadius.all(m.Radius.circular(8));

  /// 10
  static const m.BorderRadius lg = m.BorderRadius.all(m.Radius.circular(10));

  /// 12
  static const m.BorderRadius xl = m.BorderRadius.all(m.Radius.circular(12));

  /// 14
  static const m.BorderRadius xl2 = m.BorderRadius.all(m.Radius.circular(14));

  /// 16
  static const m.BorderRadius xl3 = m.BorderRadius.all(m.Radius.circular(16));

  /// 24
  static const m.BorderRadius xl4 = m.BorderRadius.all(m.Radius.circular(24));

  /// 32
  static const m.BorderRadius xl5 = m.BorderRadius.all(m.Radius.circular(32));

  /// 999
  static const m.BorderRadius full = m.BorderRadius.all(m.Radius.circular(999));
}
