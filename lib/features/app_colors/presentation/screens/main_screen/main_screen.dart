import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/theme/app_colors.dart';
import 'package:yummy/features/app_colors/presentation/bloc/colors_cubit.dart';
import 'package:yummy/features/app_colors/presentation/screens/main_screen/pages/right_side_bar.dart';

import 'pages/colors_palette.dart';
import 'pages/left_side_bar.dart';
import 'pages/tools_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _leftBarWidth = 180.0;
  static const _rightBarWidth = 280.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ColorsCubit>().getAllColorSets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainLight,
      body: Row(
        children: <Widget>[
          SizedBox(
            width: _leftBarWidth,
            child: LeftSideBar(),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: ColorPalette()),
                ToolsBar(),
              ],
            ),
          ),
          SizedBox(
            width: _rightBarWidth,
            child: RightSideBar(),
          ),
        ],
      ),
    );
  }
}
