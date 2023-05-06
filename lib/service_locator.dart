import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummy/features/app_colors/data/datasources/colors_datasource.dart';
import 'package:yummy/features/app_colors/data/datasources/colors_datasource_hive.dart';
import 'package:yummy/features/app_colors/data/repository/colors_repository_impl.dart';
import 'package:yummy/features/app_colors/domain/repository/colors_repository.dart';
import 'package:yummy/features/app_colors/domain/usecases/calculate_color_set_usecase.dart';
import 'package:yummy/features/app_colors/domain/usecases/get_all_colors_sets_usecase.dart';
import 'package:yummy/features/app_colors/domain/usecases/remove_color_set_usecase.dart';
import 'package:yummy/features/app_colors/domain/usecases/save_color_set_usecase.dart';
import 'package:yummy/features/app_colors/presentation/bloc/colors_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => ColorsCubit(
      getAllColorSets: sl<GetAllColorSets>(),
      saveColorSet: sl<SaveColorSet>(),
      removeColorSet: sl<RemoveColorSet>(),
      calculateColorSet: sl<CalculateColorSet>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllColorSets(repository: sl()));
  sl.registerLazySingleton(() => SaveColorSet(repository: sl()));
  sl.registerLazySingleton(() => RemoveColorSet(repository: sl()));
  sl.registerLazySingleton(() => CalculateColorSet());

  // Repository
  sl.registerLazySingleton<ColorsRepository>(
    () => ColorsRepositoryImpl(localDatasource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ColorsDatasource>(
    () => ColorsDatasourceHive(colorsCollection: sl()),
  );

  // External
  await Hive.initFlutter();
  final colorsCollection = await Hive.openBox('colors');//await  BoxCollection.open('Yummy', {'colors'});
  sl.registerLazySingleton(() => colorsCollection);
}
