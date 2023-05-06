import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  const AppTheme();

  ThemeData data();
}

class AppThemeLight implements AppTheme {
  const AppThemeLight();

  @override
  ThemeData data() {
    return ThemeData.from(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,

        primary: AppColors.mainDark,
        onPrimary: AppColors.mainLight,
        primaryContainer: AppColors.midLight,
        onPrimaryContainer: AppColors.mainDark,

        secondary: AppColors.midDark,
        onSecondary: AppColors.mainLight,
        secondaryContainer: AppColors.midLight,
        onSecondaryContainer: AppColors.mainDark,

        tertiary: AppColors.actInfo,
        onTertiary: AppColors.mainLight,
        tertiaryContainer: AppColors.midLight,
        onTertiaryContainer: AppColors.midDark,

        error: AppColors.actWrong,
        onError: AppColors.mainLight,
        errorContainer: AppColors.midLight,
        onErrorContainer: AppColors.midDark,

        background: AppColors.mainLight,
        onBackground: AppColors.mainLight,
        surface: AppColors.mainLight,
        onSurface: AppColors.mainDark,

        surfaceVariant: AppColors.midLight,
        onSurfaceVariant: AppColors.midDark,
        outline: AppColors.midDark,
        outlineVariant: AppColors.mainDark,
        shadow: AppColors.mainDark,

        inverseSurface: AppColors.mainDark,
        onInverseSurface: AppColors.mainLight,
        inversePrimary: AppColors.mainLight,
      ),
    );
  }
}

// class AppThemeMid implements AppTheme {
//   const AppThemeMid();
//
//
// }

class AppThemeDark implements AppTheme {
  const AppThemeDark();

  @override
  ThemeData data() {
    return ThemeData.from(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,

        primary: AppColors.mainLight,
        onPrimary: AppColors.mainDark,
        primaryContainer: AppColors.mainDark,
        onPrimaryContainer: AppColors.midLight,

        secondary: AppColors.midLight,
        onSecondary: AppColors.mainDark,
        secondaryContainer: AppColors.midDark,
        onSecondaryContainer: AppColors.mainLight,

        tertiary: AppColors.actInfo,
        onTertiary: AppColors.mainDark,
        tertiaryContainer: AppColors.midDark,
        onTertiaryContainer: AppColors.midLight,

        error: AppColors.actWrong,
        onError: AppColors.mainDark,
        errorContainer: AppColors.midDark,
        onErrorContainer: AppColors.midLight,

        background: AppColors.mainDark,
        onBackground: AppColors.mainDark,
        surface: AppColors.mainDark,
        onSurface: AppColors.mainLight,

        surfaceVariant: AppColors.midDark,
        onSurfaceVariant: AppColors.midLight,
        outline: AppColors.midLight,
        outlineVariant: AppColors.mainLight,
        shadow: AppColors.mainLight,

        inverseSurface: AppColors.mainLight,
        onInverseSurface: AppColors.mainDark,
        inversePrimary: AppColors.mainDark,
      ),
    );
  }
}
