part of 'kontak_cubit.dart';

abstract class KontakState extends Equatable {
  const KontakState();

  @override
  List<Object?> get props => [];
}

final class KontakInitial extends KontakState {}

final class GettingAllKontak extends KontakState {}

final class AllKontakLoaded extends KontakState {
  final List<KontakEntity> kontaks;

  const AllKontakLoaded(this.kontaks);

  @override
  // TODO: implement props
  List<Object?> get props => [kontaks];
}

final class KontakErrorState extends KontakState {
  final String errorMessage;

  const KontakErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
