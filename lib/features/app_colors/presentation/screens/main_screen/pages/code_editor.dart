import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/themes/agate.dart';
import 'package:highlight/languages/dart.dart';
import 'package:yummy/core/convert/color_converter.dart';
import 'package:yummy/core/theme/app_colors.dart';

import '../../../bloc/colors_cubit.dart';

class CodeEditor extends StatelessWidget {
  const CodeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: const CodeThemeData(styles: agateTheme),
      child: CodeField(
        maxLines: 15,
        readOnly: true,
        background: AppColors.midDark,
        controller: CodeController(
          language: dart,
          text: _buildSeparatorString('AppColors') +
              _buildAppColorsString(context) +
              _buildSeparatorString('AppThemeLight') +
              _buildAppThemeLightString() +
              _buildSeparatorString('AppThemeDark') +
              _buildAppThemeDarkString(),
        ),
      ),
    );
  }

  String _buildAppColorsString(BuildContext context) {
    final entity = context.watch<ColorsCubit>().getCurrentColorSet();
    if (entity == null) {
      return '// There`s no a colors set.';
    }

    String getColorValue(Color color) {
      return ColorConverter.toHexValue(color);
    }

    return
'''
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color mainDark = Color(${getColorValue(entity.mainDark)});
  static const Color midDark = Color(${getColorValue(entity.midDark)});
  static const Color midLight = Color(${getColorValue(entity.midLight)});
  static const Color mainLight = Color(${getColorValue(entity.mainLight)});

  static const Color actInfo = Color(${getColorValue(entity.actInfo)});
  static const Color actSuccess = Color(${getColorValue(entity.actSuccess)});
  static const Color actWrong = Color(${getColorValue(entity.actWrong)});
}

''';
  }

  String _buildAppThemeLightString() {
    return
      '''

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

''';
  }


  String _buildAppThemeDarkString() {
    return
      '''

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
''';
  }

  String _buildSeparatorString(String name) {
    return
'''
// ------------- $name
''';
  }
}
