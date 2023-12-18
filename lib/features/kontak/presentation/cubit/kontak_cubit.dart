import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';
import 'package:seismic_update/features/kontak/domain/usecases/create_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/delete_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/get_by_id_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/update_kontak.dart';

part 'kontak_state.dart';

class KontakCubit extends Cubit<KontakState> {
  final GettingAllKontak _gettingAllKontak;
  final GetByIdKontak _getByIdKontak;
  final CreateKontak _createKontak;
  final UpdateKontak _updateKontak;
  final DeleteKontak _deleteKontak;

  KontakCubit(this._gettingAllKontak, this._getByIdKontak, this._createKontak,
      this._updateKontak, this._deleteKontak)
      : super(KontakInitial());

  Future<void> getAllKontak() async {
    // loading
    emit(GettingAllKontak());
    // process
    
    // result 
  }

}
