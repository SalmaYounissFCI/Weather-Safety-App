import 'package:flutter/material.dart';
import 'dart:ui';

class GlassmorphismCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double blur;
  final double opacity;
  final BorderRadius borderRadius;

  const GlassmorphismCard({
    super.key,
    required this.child,
    required this.width,
    this.blur = 10.0,
    this.opacity = 0.2,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)),
  });

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.surface;

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: surfaceColor.withAlpha((255 * opacity).round()),
            borderRadius: borderRadius,
            border: Border.all(
              color: surfaceColor.withAlpha((255 * (opacity + 0.1)).round()),
              width: 1.5,
            ),
          ),
          child: child, // The content is placed here!
        ),
      ),
    );
  }
}
