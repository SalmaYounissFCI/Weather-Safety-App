import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorsLight.background,
    colorScheme: const ColorScheme.light(
      primary: AppColorsLight.primary,
      onPrimary: AppColorsLight.primaryForeground,
      secondary: AppColorsLight.secondary,
      onSecondary: AppColorsLight.secondaryForeground,
      error: AppColorsLight.destructive,
      onError: AppColorsLight.destructiveForeground,
      surface: AppColorsLight.card,
      onSurface: AppColorsLight.cardForeground,
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.h1.copyWith(
        color: AppColorsLight.textPrimary,
      ),
      displayMedium: AppTypography.h2.copyWith(
        color: AppColorsLight.textPrimary,
      ),
      headlineSmall: AppTypography.h3.copyWith(
        color: AppColorsLight.textSecondary,
      ),
      titleLarge: AppTypography.h4.copyWith(color: AppColorsLight.textPrimary),
      bodyLarge: AppTypography.body.copyWith(color: AppColorsLight.textPrimary),
      bodyMedium: AppTypography.body.copyWith(
        color: AppColorsLight.textSecondary,
      ),
      labelLarge: AppTypography.label.copyWith(color: AppColorsLight.textMuted),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsLight.buttonColor,
        foregroundColor: Colors.white,
        textStyle: AppTypography.label,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorsDark.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColorsDark.primary,
      onPrimary: AppColorsDark.primaryForeground,
      secondary: AppColorsDark.secondary,
      onSecondary: AppColorsDark.secondaryForeground,
      error: AppColorsDark.destructive,
      onError: AppColorsDark.destructiveForeground,
      surface: AppColorsDark.card,
      onSurface: AppColorsDark.cardForeground,
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.h1.copyWith(color: AppColorsDark.textPrimary),
      displayMedium: AppTypography.h2.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      headlineSmall: AppTypography.h3.copyWith(
        color: AppColorsDark.textSecondary,
      ),
      titleLarge: AppTypography.h4.copyWith(color: AppColorsDark.textPrimary),
      bodyLarge: AppTypography.body.copyWith(color: AppColorsDark.textPrimary),
      bodyMedium: AppTypography.body.copyWith(
        color: AppColorsDark.textSecondary,
      ),
      labelLarge: AppTypography.label.copyWith(color: AppColorsDark.textMuted),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsDark.buttonColor,
        foregroundColor: Colors.white,
        textStyle: AppTypography.label,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
  );
}
