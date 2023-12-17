

// part 'gempa_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:seismic_update/features/gempa/domain/usecases/get_data_gempa.dart';
import 'package:seismic_update/features/gempa/presentation/cubit/gempa_state.dart';


class GempaCubit extends Cubit<GempaState> {
  final GetDataGempa _getDataGempa;
  

  GempaCubit(this._getDataGempa) : super(GempaInitialState());

  Future<void> getDataGempa() async {
    // loading
    emit(GettingDataGempa());

    // process

    final response = await _getDataGempa.call();

    // result variant
    response.fold((l) => emit(GempaError(l.errorMessage)), (r) => emit(DataGempaLoaded(r)));
  }

}