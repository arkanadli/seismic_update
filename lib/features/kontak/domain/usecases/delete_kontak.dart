

import 'package:seismic_update/features/kontak/domain/repositories/kontak_repository.dart';

class DeleteKontak {
  final KontakRepository _repository;

  DeleteKontak(this._repository);

  Future<void> call(String id) async {
    await _repository.delete(id);
  }
}