import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme/app_colors.dart';

class GlassmorphismCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double blur;
  final BorderRadius borderRadius;
  final Color? borderColor;
  final bool isPadded;

  const GlassmorphismCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.blur = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(20.0)),
    this.borderColor,
    this.isPadded = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final glassColor = isDarkMode
        ? AppColorsDark.glassBg
        : AppColorsLight.glassBg;
    final defaultBorderColor = isDarkMode
        ? AppColorsDark.glassBorder
        : AppColorsLight.glassBorder;

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          padding: isPadded ? const EdgeInsets.all(16.0) : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: glassColor,
            borderRadius: borderRadius,
            border: Border.all(
              color: borderColor ?? defaultBorderColor,
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
