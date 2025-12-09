import 'dart:math' as math;

import 'package:flutter/material.dart' hide Colors;

import '../../core/colors.dart' hide Color;

class Spinner extends ProgressIndicator {
  /// The width of the line used to draw the circle.
  final SpinnerSize size;

  const Spinner({
    super.key,
    super.value,
    super.color,
    this.size = SpinnerSize.md,
  });

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    if (widget.value == null) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(Spinner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating) {
      _controller.repeat();
    } else if (widget.value != null && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProgressIndicatorThemeData indicatorTheme = ProgressIndicatorTheme.of(
      context,
    );
    final _SpinnerDefaults defaults = _SpinnerDefaults(context);

    final double strokeWidth = widget.size.strokeWidth;
    final BoxConstraints constraints = widget.size.constraints;
    final Color color = widget.color ?? indicatorTheme.color ?? defaults.color;

    return RotationTransition(
      turns: widget.value != null
          ? AlwaysStoppedAnimation(widget.value!)
          : Tween(begin: 1.0, end: 0.0).animate(_controller),
      child: ConstrainedBox(
        constraints: constraints,
        child: CustomPaint(
          painter: SpinnerPainter(
            gradientColors: [color, color, Colors.transparent],
            strokeWidth: strokeWidth,
          ),
        ),
      ),
    );
  }
}

class SpinnerPainter extends CustomPainter {
  final List<Color> gradientColors;
  final double strokeWidth;

  SpinnerPainter({required this.gradientColors, required this.strokeWidth});

  double _degreeToRad(double degree) => degree * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double strokeOffset =
        strokeWidth / 2 * -CircularProgressIndicator.strokeAlignInside;
    final Offset arcBaseOffset = Offset(strokeOffset, strokeOffset);
    final Size arcActualSize = Size(
      size.width - strokeOffset * 2,
      size.height - strokeOffset * 2,
    );

    double centerPoint = arcActualSize.height / 2;

    paint.shader = SweepGradient(
      colors: [...gradientColors],
      stops: [0, 0.18, 1],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(arcBaseOffset & arcActualSize);

    var scapSize = strokeWidth * 0.6;
    double scapToDegree = scapSize / centerPoint;

    double startAngle = _degreeToRad(270) + scapToDegree;
    double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(
      arcBaseOffset & arcActualSize,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _SpinnerDefaults extends ProgressIndicatorThemeData {
  _SpinnerDefaults(this.context);

  final BuildContext context;

  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  Color get color => _colors.primary;
}

enum SpinnerSize {
  sm,
  md,
  lg,
  xl;

  double get strokeWidth => switch (this) {
    SpinnerSize.sm => 2.4,
    SpinnerSize.md => 4.8,
    SpinnerSize.lg => 3.6,
    SpinnerSize.xl => 9.6,
  };

  BoxConstraints get constraints => switch (this) {
    SpinnerSize.sm => BoxConstraints.tight(Size.square(16)),
    SpinnerSize.md => BoxConstraints.tight(Size.square(24)),
    SpinnerSize.lg => BoxConstraints.tight(Size.square(32)),
    SpinnerSize.xl => BoxConstraints.tight(Size.square(64)),
  };
}
