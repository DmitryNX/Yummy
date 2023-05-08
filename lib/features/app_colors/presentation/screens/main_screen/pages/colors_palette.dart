import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/app_colors/domain/entities/color_names.dart';
import 'package:yummy/features/app_colors/domain/entities/colors_entity.dart';
import 'package:yummy/features/app_colors/presentation/widgets/color_palette_item.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../bloc/colors_cubit.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsCubit, ColorsState>(
      builder: (context, state) {
        if (state is EmptyColorsState) {
          return _buildEmptyState();
        } else if (state is LoadingColorsState) {
          return _buildLoadingState();
        } else if (state is LoadedColorsState) {
          if (state.items.isEmpty) {
            return _buildEmptyState();
          }
          return _buildBody(context, state.currentColorsEntity);
        }
        return _buildErrorState();
      },
    );
  }

  Widget _buildEmptyState() {
    return _buildMessage(
      text: 'Yummy App',
      color: AppColors.mainDark,
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.midLight,
        strokeWidth: 1.5,
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
    return Center(
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ColorsEntity item) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildMainPalette(context, item),
                const SizedBox(height: 15),
                _buildTargetPalette(item),
                const SizedBox(height: 15),
                _buildVariantPalette(
                  name: 'Main Light',
                  textColor: item.mainLight,
                  item: item,
                ),
                const SizedBox(height: 5),
                _buildVariantPalette(
                  name: 'Mid Light',
                  textColor: item.midLight,
                  item: item,
                ),
                const SizedBox(height: 5),
                _buildVariantPalette(
                  name: 'Mid Dark',
                  textColor: item.midDark,
                  item: item,
                ),
                const SizedBox(height: 5),
                _buildVariantPalette(
                  name: 'Main Dark',
                  textColor: item.mainDark,
                  item: item,
                ),
                const SizedBox(height: 15),
                _buildVariantPalette(
                  name: 'Act Info',
                  textColor: item.actInfo,
                  item: item,
                ),
                const SizedBox(height: 5),
                _buildVariantPalette(
                  name: 'Act Success',
                  textColor: item.actSuccess,
                  item: item,
                ),
                const SizedBox(height: 5),
                _buildVariantPalette(
                  name: 'Act Wrong',
                  textColor: item.actWrong,
                  item: item,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainPalette(BuildContext context, ColorsEntity item) {
    return Row(
      children: <Widget>[
        ColorPaletteItem(
          name: 'Main Light',
          color: item.mainLight,
          textColor: item.mainDark,
          onPressed: () {
            context.read<ColorsCubit>()
              .setCurrentColorItem(ColorNames.mainLight);
          },
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: 'Main Dark',
          color: item.mainDark,
          textColor: item.mainLight,
          onPressed: () {
            context
                .read<ColorsCubit>()
                .setCurrentColorItem(ColorNames.mainDark);
          },
        ),
      ],
    );
  }

  Widget _buildTargetPalette(ColorsEntity item) {
    return Row(
      children: <Widget>[
        ColorPaletteItem(
          name: 'Main Light',
          color: item.mainLight,
          textColor: item.mainDark,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: 'Mid Light',
          color: item.midLight,
          textColor: item.mainDark,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: 'Mid Dark',
          color: item.midDark,
          textColor: item.mainLight,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: 'Main Dark',
          color: item.mainDark,
          textColor: item.mainLight,
        ),
        const SizedBox(width: 15),
        ColorPaletteItem(
          name: 'Act Info',
          color: item.actInfo,
          textColor: item.mainLight,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: 'Act Success',
          color: item.actSuccess,
          textColor: item.mainLight,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: 'Act Wrong',
          color: item.actWrong,
          textColor: item.mainLight,
        ),
      ],
    );
  }

  Widget _buildVariantPalette({
    required Color textColor,
    required String name,
    required ColorsEntity item,
  }) {
    return Row(
      children: <Widget>[
        ColorPaletteItem(
          name: name,
          color: item.mainLight,
          textColor: textColor,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: name,
          color: item.midLight,
          textColor: textColor,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: name,
          color: item.midDark,
          textColor: textColor,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: name,
          color: item.mainDark,
          textColor: textColor,
        ),
        const SizedBox(width: 15),
        ColorPaletteItem(
          name: name,
          color: item.actInfo,
          textColor: textColor,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: name,
          color: item.actSuccess,
          textColor: textColor,
        ),
        const SizedBox(width: 5),
        ColorPaletteItem(
          name: name,
          color: item.actWrong,
          textColor: textColor,
        ),
      ],
    );
  }
}
