import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';
import 'package:yummy/features/app_colors/presentation/bloc/colors_cubit.dart';

import 'simple_icon_button.dart';

typedef OnCallback = void Function();

class ColorsListItem extends StatelessWidget {
  final ColorsEntity item;
  final Color bgColor;
  final Color headerColor;
  final OnCallback onPress;

  const ColorsListItem({
    Key? key,
    required this.item,
    required this.bgColor,
    required this.headerColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              _buildHeader(context),
              const SizedBox(height: 5),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          item.name,
          style: TextStyle(
            color: headerColor,
          ),
        ),
        SimpleIconButton(
          onPressed: _removeColorSet,
          iconColor: headerColor,
          icon: Icons.close_rounded,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildColorItem(color: item.mainDark),
        _buildColorItem(color: item.midDark),
        _buildColorItem(color: item.midLight),
        _buildColorItem(color: item.mainLight),
        _buildColorItem(color: item.actInfo),
        _buildColorItem(color: item.actSuccess),
        _buildColorItem(color: item.actWrong),
      ],
    );
  }

  Widget _buildColorItem({required Color color}) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }

  void _removeColorSet(BuildContext context) {
    context.read<ColorsCubit>().removeColorSet(item.name);
  }
}
