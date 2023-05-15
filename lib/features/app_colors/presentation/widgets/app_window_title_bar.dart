import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AppWindowTitleBar extends StatelessWidget {
  const AppWindowTitleBar({Key? key}) : super(key: key);

  static final _colors = WindowButtonColors(
    iconNormal: AppColors.mainLight,
    mouseOver: AppColors.actInfo,
    mouseDown: AppColors.mainDark,
    iconMouseOver: AppColors.mainDark,
    iconMouseDown: AppColors.actSuccess,
  );

  static final _colorsClose = WindowButtonColors(
    iconNormal: AppColors.mainLight,
    mouseOver: AppColors.actWrong,
    mouseDown: AppColors.mainDark,
    iconMouseOver: AppColors.mainDark,
    iconMouseDown: AppColors.actSuccess,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.midDark,
      height: 32,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: MoveWindow(
            child: const Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text('Yummy'),
              ],
            ),
          )),
          MinimizeWindowButton(colors: _colors),
          MaximizeWindowButton(colors: _colors),
          CloseWindowButton(colors: _colorsClose),
        ],
      ),
    );
  }
}
