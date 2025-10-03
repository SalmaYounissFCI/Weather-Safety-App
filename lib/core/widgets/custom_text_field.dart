import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.lable,
    required this.textTheme,
    required this.colors,
  });
  final String lable;
  final TextTheme textTheme;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: textTheme.bodyLarge?.copyWith(color: colors.onSurface),
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: colors.onSurface.withOpacity(0.7),
        ),
        filled: true,
        fillColor: colors.surface.withOpacity(0.08),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: colors.onSurface.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: colors.primary),
        ),
      ),
    );
  }
}
