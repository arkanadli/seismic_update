import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';
import 'package:seismic_update/features/kontak/domain/repositories/kontak_repository.dart';

class UpdateKontak {
  final KontakRepository _kontakRepository;

  UpdateKontak(this._kontakRepository);

  Future<void> call(KontakEntity kontakEntity) async {
    await _kontakRepository.update(kontakEntity);
  }
}
