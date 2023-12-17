import 'package:equatable/equatable.dart';
import 'package:seismic_update/features/gempa/data/models/gempa_model.dart';
import 'package:seismic_update/features/gempa/domain/entities/gempa_entity.dart';

abstract class GempaState extends Equatable {
  const GempaState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GempaInitialState extends GempaState {}

class GettingDataGempa extends GempaState {}

class DataGempaLoaded extends GempaState {
  final List<GempaEntity> dataGempa;

  const DataGempaLoaded(this.dataGempa);

  @override
  // TODO: implement props
  List<Object?> get props => dataGempa.map((e) => e.dateTime).toList();
}

class GempaError extends GempaState {
  final String errorMessage;

  const GempaError(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
