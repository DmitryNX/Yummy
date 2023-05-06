import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

typedef ContextCallback = void Function(BuildContext context);

class SimpleIconButton extends StatelessWidget {
  final ContextCallback onPressed;
  final Color iconColor;
  final IconData icon;

  const SimpleIconButton({
    Key? key,
    required this.onPressed,
    required this.iconColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(context),
      iconSize: 20,

      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
