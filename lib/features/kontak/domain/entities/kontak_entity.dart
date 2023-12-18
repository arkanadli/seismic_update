import 'package:equatable/equatable.dart';

class KontakEntity extends Equatable {
  final String id;
  final String nama;
  final String nomorHp;
  final String keterangan;

  const KontakEntity({
    required this.id,
    required this.nama,
    required this.nomorHp,
    required this.keterangan,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        nama,
        nomorHp,
        keterangan,
      ];
}
