import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../bloc/colors_cubit.dart';
import 'simple_icon_button.dart';

enum _ColorsListHeaderMode {
  main,
  create,
}

class ColorsListHeader extends StatefulWidget {
  const ColorsListHeader({Key? key}) : super(key: key);

  @override
  State<ColorsListHeader> createState() => _ColorsListHeaderState();
}

class _ColorsListHeaderState extends State<ColorsListHeader> {
  _ColorsListHeaderMode _mode = _ColorsListHeaderMode.main;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _selectMode(context),
    );
  }

  List<Widget> _selectMode(BuildContext context) {
    return _mode == _ColorsListHeaderMode.main
        ? _buildMainMode(context)
        : _buildCreateMode(context);
  }

  List<Widget> _buildMainMode(BuildContext context) {
    return <Widget>[
      const Expanded(
        child: Text(
          'Colors',
          style: TextStyle(
            color: AppColors.mainDark,
          ),
        ),
      ),
      SimpleIconButton(
        onPressed: _updateItems,
        iconColor: AppColors.mainDark,
        icon: Icons.update_rounded,
      ),
      const SizedBox(width: 2),
      SimpleIconButton(
        onPressed: _setCreateMode,
        iconColor: AppColors.mainDark,
        icon: Icons.add_rounded,
      ),
    ];
  }

  List<Widget> _buildCreateMode(BuildContext context) {
    return <Widget>[
      Expanded(
        child: TextField(
          decoration: const InputDecoration.collapsed(hintText: 'Name..'),
          style: const TextStyle(color: AppColors.mainDark),
          controller: _textController,
        ),
      ),
      SimpleIconButton(
        onPressed: _create,
        iconColor: AppColors.mainDark,
        icon: Icons.add_rounded,
      ),
    ];
  }

  void _updateItems(BuildContext context) {
    context.read<ColorsCubit>().getAllColorSets();
  }

  void _setCreateMode(BuildContext context) {
    setState(() {
      _mode = _ColorsListHeaderMode.create;
    });
  }

  void _create(BuildContext context) {
    final name = _textController.text;
    if (!context.read<ColorsCubit>().validateColorsSetName(name)) return;

    context.read<ColorsCubit>().createColorSet(name);
    setState(() {
      _textController.text = '';
      _mode = _ColorsListHeaderMode.main;
    });
  }
}
