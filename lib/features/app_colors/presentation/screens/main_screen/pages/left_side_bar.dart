import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/app_colors/presentation/bloc/colors_cubit.dart';
import 'package:yummy/features/app_colors/presentation/widgets/colors_list_item.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../widgets/colors_list_header.dart';
import '../../../widgets/tool_page.dart';

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      header: _buildHeader(context),
      body: _buildBody(context),
      side: ToolPageSide.left,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const ColorsListHeader();
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ColorsCubit, ColorsState>(
      builder: (context, state) {
        if (state is EmptyColorsState) {
          return _buildEmptyState();
        } else if (state is LoadingColorsState) {
          return _buildLoadingState();
        } else if (state is LoadedColorsState) {
          return _buildColorsList(context, state);
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

  Widget _buildColorsList(BuildContext context, LoadedColorsState state) {
    if (state.items.isEmpty) {
      return _buildEmptyState();
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final isCurrent = index == state.currentIndex;

            final bgColor = isCurrent
              ? AppColors.midLight
              : AppColors.mainDark;

            final titleColor = isCurrent
                ? AppColors.mainDark
                : AppColors.midLight;

            return ColorsListItem(
              item: state.items[index],
              bgColor: bgColor,
              headerColor: titleColor,
              onPress: () {
                context.read<ColorsCubit>().setCurrentIndex(index);
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: state.items.length,
        ),
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
