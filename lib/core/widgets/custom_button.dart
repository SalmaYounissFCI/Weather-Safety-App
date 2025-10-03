import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final bool withShadow;
  final Color? shadowColor;
  final Widget? icon;
  final Color? overlayColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.height = 55,
    this.borderRadius = 14,
    this.withShadow = false,
    this.shadowColor,
    this.icon,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize: Size(double.infinity, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ).copyWith(
            overlayColor: overlayColor != null
                ? WidgetStateProperty.all(overlayColor)
                : null,
          ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 8)],
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    return withShadow
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                  color: (shadowColor ?? backgroundColor).withAlpha(150),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: button,
          )
        : button;
  }
}
