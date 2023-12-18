import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:seismic_update/features/gempa/data/data_sources/remote/gempa_remote.dart';
import 'package:seismic_update/features/gempa/data/repositories_impl/gempa_repository_impl.dart';
import 'package:seismic_update/features/gempa/domain/repositories/gempa_repository.dart';
import 'package:seismic_update/features/gempa/domain/usecases/get_data_gempa.dart';
import 'package:seismic_update/features/gempa/presentation/cubit/gempa_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:seismic_update/features/kontak/data/repository_impl/kontak_repository_impl.dart';
import 'package:seismic_update/features/kontak/domain/repositories/kontak_repository.dart';
import 'package:seismic_update/features/kontak/domain/usecases/create_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/delete_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/get_all_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/get_by_id_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/update_kontak.dart';
import 'package:seismic_update/features/kontak/presentation/cubit/kontak_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // :: FEATURE GEMPA
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

  // :: FEATURE KONTAK
  // external dependencies
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // repository
  sl.registerLazySingleton<KontakRepository>(() => KontakRepositoryImpl(sl()));

  // usecase
  sl.registerLazySingleton<GetAllKontak>(() => GetAllKontak(sl()));
  sl.registerLazySingleton<GetByIdKontak>(() => GetByIdKontak(sl()));
  sl.registerLazySingleton<CreateKontak>(() => CreateKontak(sl()));
  sl.registerLazySingleton<UpdateKontak>(() => UpdateKontak(sl()));
  sl.registerLazySingleton<DeleteKontak>(() => DeleteKontak(sl()));
}
