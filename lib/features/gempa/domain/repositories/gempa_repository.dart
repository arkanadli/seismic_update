import 'package:dartz/dartz.dart';
import 'package:seismic_update/core/errors/failure.dart';
import 'package:seismic_update/features/gempa/domain/entities/gempa_entity.dart';

abstract class GempaRepository {
  GempaRepository();

  Future<Either<Failure, List<GempaEntity>>> getDataGempa();

  
}

