import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/theme/app_colors.dart';
import 'package:yummy/core/theme/app_theme.dart';
import 'package:yummy/features/app_colors/presentation/bloc/colors_cubit.dart';
import 'package:yummy/features/app_colors/presentation/screens/main_screen/main_screen.dart';

import 'service_locator.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(1280, 720);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;

  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy',
      theme: const AppThemeLight().data(),
      darkTheme: const AppThemeDark().data(),
      color: AppColors.mainDark,
      home: BlocProvider<ColorsCubit>(
        create: (context) => di.sl<ColorsCubit>(),
        child: const MainScreen(),
      ),
    );
  }
}
