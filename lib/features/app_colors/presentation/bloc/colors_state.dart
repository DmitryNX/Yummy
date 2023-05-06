part of 'colors_cubit.dart';

abstract class ColorsState extends Equatable {
  const ColorsState();
}

class EmptyColorsState extends ColorsState {
  @override
  List<Object> get props => [];
}

class LoadingColorsState extends ColorsState {
  @override
  List<Object> get props => [];
}

class LoadedColorsState extends ColorsState {
  final List<ColorsEntity> items;
  final int currentIndex;
  final ColorNames currentColorName;

  const LoadedColorsState({
   required this.items,
    this.currentIndex = 0,
    this.currentColorName = ColorNames.mainLight,
  });

  @override
  List<Object> get props => [items, currentIndex, currentColorName];

  ColorsEntity get currentColorsEntity => items[currentIndex];

  Color get currentColor {
    final colors = currentColorsEntity;
    switch (currentColorName) {
      case ColorNames.mainLight:
        return colors.mainLight;
      case ColorNames.midLight:
        return colors.midLight;
      case ColorNames.midDark:
        return colors.midDark;
      case ColorNames.mainDark:
        return colors.mainDark;
      case ColorNames.actInfo:
        return colors.actInfo;
      case ColorNames.actSuccess:
        return colors.actSuccess;
      case ColorNames.actWrong:
        return colors.actWrong;
    }
  }

  LoadedColorsState copyWith({
    List<ColorsEntity>? items,
    int? currentIndex,
    ColorNames? currentColorName,
  }) {
    return LoadedColorsState(
      items: items ?? this.items,
      currentIndex: currentIndex ?? this.currentIndex,
      currentColorName: currentColorName ?? this.currentColorName,
    );
  }
}

class ErrorColorsState extends ColorsState {
  final String message;

  const ErrorColorsState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
