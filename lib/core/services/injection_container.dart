import 'package:get_it/get_it.dart';
import 'package:seismic_update/features/gempa/data/data_sources/remote/gempa_remote.dart';
import 'package:seismic_update/features/gempa/data/repositories_impl/gempa_repository_impl.dart';
import 'package:seismic_update/features/gempa/domain/repositories/gempa_repository.dart';
import 'package:seismic_update/features/gempa/domain/usecases/get_data_gempa.dart';
import 'package:seismic_update/features/gempa/presentation/cubit/gempa_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // external dependecies
  sl.registerSingleton<http.Client>(http.Client());
  // remote
  sl.registerSingleton<GempaRemoteDataSource>(GempaRemoteDataSourceImpl(sl()));
  // repository
  sl.registerSingleton<GempaRepository>(GempaRepositoryImpl(sl()));
  // usecase
  sl.registerSingleton<GetDataGempa>(GetDataGempa(sl()));
  // cubit
  sl.registerFactory<GempaCubit>(() => GempaCubit(sl()));
}
