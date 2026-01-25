import 'package:flutter/material.dart' hide Colors, Radius;
import '../../core/colors.dart';
import '../../core/icons.dart';
import '../../core/spacing.dart';
import '../../core/theme/components/accordion.theme.dart';

final class Accordion extends StatefulWidget {
  final AccordionVariants variant;
  final String title;
  final String content;
  final bool initiallyExpanded;

  const Accordion({
    super.key,
    required this.variant,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
  });

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  static final _halfTween = Tween<double>(begin: 0.0, end: 0.5);
  static final _easeInTween = CurveTween(curve: Curves.easeIn);

  late Animation<double> _iconTurns;
  late ExpansibleController _expansibleController;

  @override
  void initState() {
    super.initState();
    _expansibleController = ExpansibleController();
    if (widget.initiallyExpanded) {
      _expansibleController.expand();
    }
  }

  Widget _buildIcon(BuildContext context, Animation<double> animation) {
    _iconTurns = animation.drive(_halfTween.chain(_easeInTween));
    return RotationTransition(
      turns: _iconTurns,
      child: Icon(
        _expansibleController.isExpanded ? Icons.close : Icons.add,
        size: IconSize.size20,
        color: widget.variant.iconColor(context),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Animation<double> animation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(widget.title, style: widget.variant.titleStyle(context)),
        ),
        _buildIcon(context, animation),
      ],
    );
  }

  Widget _buildBody(BuildContext context, Animation<double> animation) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: Spacing.spacing8),
        child: Text(widget.content, style: widget.variant.textStyle(context)),
      ),
    );
  }

  Widget _buildExpansible(
    BuildContext context,
    Widget header,
    Widget body,
    Animation<double> animation,
  ) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(
      context,
    );
    final String onTapHint = _expansibleController.isExpanded
        ? localizations.expansionTileExpandedTapHint
        : localizations.expansionTileCollapsedTapHint;

    return Semantics(
      onTapHint: onTapHint,
      child: InkWell(
        onTap: () {
          _expansibleController.isExpanded
              ? _expansibleController.collapse()
              : _expansibleController.expand();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: widget.variant.padding,
              decoration: BoxDecoration(
                borderRadius: widget.variant.borderRadius,
                color: widget.variant.background(context),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[header, body],
              ),
            ),
            if (widget.variant == AccordionVariants.outlined)
              Divider(color: Colors.neutral[300]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expansible(
      controller: _expansibleController,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 200),
      headerBuilder: _buildHeader,
      bodyBuilder: _buildBody,
      expansibleBuilder: _buildExpansible,
    );
  }
}
