import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/dart.dart';
import 'package:yummy/core/theme/app_colors.dart';
import 'package:yummy/features/app_colors/presentation/screens/main_screen/pages/code_editor.dart';
import 'package:yummy/features/app_colors/presentation/widgets/simple_icon_button.dart';
import 'package:yummy/features/app_colors/presentation/widgets/tool_page.dart';

typedef OnPress = void Function();

class CodePage extends StatelessWidget {
  final OnPress onClose;

  const CodePage({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      header: _buildHeader(),
      body: _buildBody(),
      side: ToolPageSide.bottom,
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Text(
            'Code Page',
            style: TextStyle(
              color: AppColors.mainDark,
            ),
          ),
        ),
        SimpleIconButton(
          onPressed: (_) => onClose(),
          iconColor: AppColors.mainDark,
          icon: Icons.close_rounded,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return const CodeEditor();
  }
}
