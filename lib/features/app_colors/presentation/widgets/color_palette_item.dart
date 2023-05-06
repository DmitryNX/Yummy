import 'package:flutter/material.dart';
import 'package:yummy/core/convert/color_converter.dart';
import 'package:yummy/core/theme/app_colors.dart';

typedef FnCallback = void Function();

class ColorPaletteItem extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String name;

  final FnCallback? onPressed;

  const ColorPaletteItem({
    Key? key,
    required this.color,
    required this.name,
    required this.textColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 60,
            // minWidth: 100,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.midDark, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildText(text: name),
        const SizedBox(height: 5),
        _buildText(
          text: ColorConverter.toHex(color),
          fontSize: 11,
        ),
      ],
    );
  }

  Widget _buildText({
    required String text,
    double? fontSize,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
