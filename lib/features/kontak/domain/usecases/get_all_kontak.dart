import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';
import 'package:seismic_update/features/kontak/domain/repositories/kontak_repository.dart';

class GetAllKontak {
  final KontakRepository _repository;

  GetAllKontak(this._repository);

  Stream<List<KontakEntity>> call() {
    return _repository.getAllKontak();
  }
}
