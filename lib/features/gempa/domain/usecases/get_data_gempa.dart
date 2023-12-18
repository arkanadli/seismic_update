import 'package:dartz/dartz.dart';
import 'package:seismic_update/core/errors/failure.dart';
import 'package:seismic_update/core/usecase/usecase.dart';
import 'package:seismic_update/features/gempa/domain/entities/gempa_entity.dart';
import 'package:seismic_update/features/gempa/domain/repositories/gempa_repository.dart';

class GetDataGempa extends UsecaseWithoutParams<List<GempaEntity>> {
  final GempaRepository _repository;

  GetDataGempa(this._repository);

  @override
  Future<Either<Failure, List<GempaEntity>>> call() async {
    return await _repository.getDataGempa();
  }
}
