import 'package:dartz/dartz.dart';
import 'package:seismic_update/core/errors/exceptions.dart';
import 'package:seismic_update/core/errors/failure.dart';
import 'package:seismic_update/features/gempa/data/data_sources/remote/gempa_remote.dart';
import 'package:seismic_update/features/gempa/domain/entities/gempa_entity.dart';
import 'package:seismic_update/features/gempa/domain/repositories/gempa_repository.dart';

class GempaRepositoryImpl extends GempaRepository {
  GempaRepositoryImpl(this._dataSource);
  final GempaRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<GempaEntity>>> getDataGempa() async {
    try {
      final dataGempa = await _dataSource.getDataGempa();
      return Right(dataGempa);
    } on ApiException catch (e) {
      return Left(
        ApiFailure(message: e.message, statusCode: e.statusCode),
      );
    }
  }
}
