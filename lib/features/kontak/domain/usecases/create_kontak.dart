import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';
import 'package:seismic_update/features/kontak/domain/repositories/kontak_repository.dart';

class CreateKontak {
  final KontakRepository _repository;

  CreateKontak(this._repository);

  Future<void> call(KontakEntity kontakEntity) async {
    return await _repository.create(kontakEntity);
  }
}
