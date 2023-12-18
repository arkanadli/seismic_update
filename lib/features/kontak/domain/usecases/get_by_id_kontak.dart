import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';
import 'package:seismic_update/features/kontak/domain/repositories/kontak_repository.dart';

class GetByIdKontak {
  final KontakRepository _repository;

  GetByIdKontak(this._repository);

  Future<KontakEntity> execute(String id) async {
    return await _repository.getByIdKontak(id);
  }
}
