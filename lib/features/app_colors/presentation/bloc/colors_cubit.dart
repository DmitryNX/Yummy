import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/core/generator/color_generator.dart';

import '../../data/models/colors_model.dart';
import '../../domain/entities/color_names.dart';
import '../../domain/entities/colors_entity.dart';
import '../../domain/usecases/calculate_color_set_usecase.dart';
import '../../domain/usecases/get_all_colors_sets_usecase.dart';
import '../../domain/usecases/remove_color_set_usecase.dart';
import '../../domain/usecases/save_color_set_usecase.dart';

part 'colors_state.dart';

class ColorsCubit extends Cubit<ColorsState> {
  final GetAllColorSets _getAllColorSets;
  final SaveColorSet _saveColorSet;
  final RemoveColorSet _removeColorSet;
  final CalculateColorSet _calculateColorSet;

  ColorsCubit({
    required getAllColorSets,
    required saveColorSet,
    required removeColorSet,
    required calculateColorSet,
  })  : _getAllColorSets = getAllColorSets,
        _saveColorSet = saveColorSet,
        _removeColorSet = removeColorSet,
        _calculateColorSet = calculateColorSet,
        super(EmptyColorsState());

  Future<void> getAllColorSets() async {
    LoadedColorsState? oldState;
    if (_isLoadedState()) {
      oldState = _getLoadedStateUnchecked();
    }

    emit(LoadingColorsState());
    final result = await _getAllColorSets(GetAllColorSetsParams());
    result.fold(
      _failureHandler,
      (items) {
        final currentIndex = _fixCurrentIndex(
          index: oldState?.currentIndex ?? 0,
          itemsCount: items.length,
        );
        emit(
          oldState?.copyWith(
                items: items,
                currentIndex: currentIndex,
              ) ??
              LoadedColorsState(
                items: items,
                currentIndex: currentIndex,
              ),
        );
      },
    );
  }

  Future<void> saveColorSet(ColorsModel entity) async {
    final result = await _saveColorSet(SaveColorSetParams(entity));
    result.fold(
      _failureHandler,
      (_) => null,
    );
  }

  Future<void> saveCurrentColorSet() async {
    if (_isLoadedState()) {
      await saveColorSet(
        _getLoadedStateUnchecked().currentColorsEntity as ColorsModel,
      );
    }
  }

  Future<void> removeColorSet(ColorsEntityId id) async {
    if (!_isLoadedState()) return;

    final result = await _removeColorSet(RemoveColorSetParams(id));

    final oldState = _getLoadedStateUnchecked();
    List<ColorsEntity> items =
        oldState.items.where((item) => item.name != id).toList();

    final currentIndex = _getCurrentIndex();
    emit(LoadingColorsState());
    result.fold(
      _failureHandler,
      (_) => emit(oldState.copyWith(
        items: items,
        currentIndex: _fixCurrentIndex(
          index: currentIndex,
          itemsCount: items.length,
        ),
      )),
    );
  }

  Future<void> createColorSet(ColorsEntityId name) async {
    final mainLight = ColorGenerator.randomColor();
    final mainDark = ColorGenerator.randomColor();
    final result = await _calculateColorSet(CalculateColorSetParams(
        name: name, mainLight: mainLight, mainDark: mainDark));

    result.fold(
      _failureHandler,
      (entity) async {
        (await _saveColorSet(SaveColorSetParams(entity))).fold(
          _failureHandler,
          (_) => emit(LoadedColorsState(items: _insertToItemsAndGet(entity))),
        );
      },
    );
  }

  bool validateColorsSetName(String name) {
    if (name.isEmpty || !_isLoadedState()) {
      return false;
    }
    return !_getLoadedStateUnchecked().items.any((item) => item.name == name);
  }

  Future<void> calculateColorSet({
    required Color mainLight,
    required Color mainDark,
  }) async {
    if (state is! LoadedColorsState) return;

    final curState = _getLoadedStateUnchecked();
    final colorEntity = curState.currentColorsEntity;
    final result = await _calculateColorSet(CalculateColorSetParams(
      name: colorEntity.name,
      mainLight: mainLight,
      mainDark: mainDark,
    ));

    result.fold(
      _failureHandler,
      (entity) => emit(curState.copyWith(
        items: _replaceInItemsAndGet(entity),
      )),
    );
  }

  Future<void> setCurrentIndex(int index) async {
    if (!_isLoadedState()) return;

    final oldState = _getLoadedStateUnchecked();
    if (index < 0 || index >= oldState.items.length) return;

    emit(oldState.copyWith(currentIndex: index));
  }

  Future<void> setCurrentColorItem(ColorNames colorName) async {
    if (!_isLoadedState()) return;
    emit(
      _getLoadedStateUnchecked().copyWith(currentColorName: colorName),
    );
  }

  Future<void> calculateWithCurrentColor(Color color) async {
    if (!_isLoadedState()) return;

    final curState = _getLoadedStateUnchecked();
    final colorEntity = curState.currentColorsEntity;
    await calculateColorSet(
      mainLight: curState.currentColorName == ColorNames.mainLight
          ? color
          : colorEntity.mainLight,
      mainDark: curState.currentColorName == ColorNames.mainDark
          ? color
          : colorEntity.mainDark,
    );

    await saveCurrentColorSet();
  }

  bool _isLoadedState() {
    return state is LoadedColorsState;
  }

  LoadedColorsState _getLoadedStateUnchecked() {
    return state as LoadedColorsState;
  }

  void _failureHandler(Failure failure) {
    final message = failure is LocalFailure ? failure.message : 'Unknown Error';
    emit(ErrorColorsState(message: message));
  }

  List<ColorsEntity> _insertToItemsAndGet(ColorsEntity item) {
    return [item, ..._getCurrentItemsCopy()];
  }

  List<ColorsEntity> _replaceInItemsAndGet(ColorsEntity entity) {
    return _getCurrentItemsCopy()
      .map(
        (item) => item.name == entity.name ? entity : item,
      )
      .toList();
  }

  List<ColorsEntity> _getCurrentItemsCopy() {
    return _isLoadedState()
      ? [..._getLoadedStateUnchecked().items]
      : [];
  }

  int _getCurrentIndex() {
    return _isLoadedState()
      ? _getLoadedStateUnchecked().currentIndex
      : 0;
  }

  int _fixCurrentIndex({
    required int index,
    required int itemsCount,
  }) {
    if (itemsCount < 1 || index < 0) return 0;
    if (index < itemsCount) return index;
    if (itemsCount <= index) {
      return itemsCount - 1;
    }
    return 0;
  }
}
