import 'package:dartz/dartz.dart';
import 'package:seismic_update/core/errors/failure.dart';
import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';

abstract class KontakRepository {
  KontakRepository();

  Stream<List<KontakEntity>> getAllKontak();

  Future<KontakEntity> getByIdKontak(String id);

  Future<void> create(KontakEntity kontakEntity);

  Future<void> update(KontakEntity kontakEntity);

  Future<void> delete(String id);
}
