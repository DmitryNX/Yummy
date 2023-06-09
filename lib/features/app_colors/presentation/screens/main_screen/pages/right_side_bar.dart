import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yummy/features/app_colors/presentation/widgets/tool_page.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../bloc/colors_cubit.dart';

class RightSideBar extends StatelessWidget {
  const RightSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      header: _buildHeader(context),
      body: _buildBody(context),
      side: ToolPageSide.right,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Text(
      'Properties',
      style: TextStyle(
        color: AppColors.mainDark,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ColorsCubit, ColorsState>(
      builder: (context, state) {
        if (state is EmptyColorsState) {
          return _buildEmptyState();
        } else if (state is LoadingColorsState) {
          return _buildLoadingState();
        } else if (state is LoadedColorsState) {
          return _buildLoadedState(context, state);
        }
        return _buildErrorState();
      },
    );
  }

  Widget _buildEmptyState() {
    return _buildMessage(
      text: 'No color sets yet.',
      color: AppColors.midLight,
    );
  }

  Widget _buildLoadingState() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.midLight,
          strokeWidth: 1.5,
        ),
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, LoadedColorsState state) {
    if (state.items.isEmpty) {
      return _buildEmptyState();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ColorPicker(
            pickerColor: state.currentColor,
            displayThumbColor: true,
            hexInputBar: true,
            portraitOnly: true,
            pickerAreaBorderRadius: BorderRadius.circular(5),
            onColorChanged: (color) {
              context.read<ColorsCubit>()
                .calculateWithCurrentColor(color);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return _buildMessage(
      text: 'Something went wrong.',
      color: AppColors.actWrong,
    );
  }

  Widget _buildMessage({
    required String text,
    required Color color,
  }) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
