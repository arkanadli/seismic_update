import 'package:equatable/equatable.dart';

class GempaEntity extends Equatable {
  final String tanggal;
  final String jam;
  final DateTime dateTime;
  final String coordinates;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;

  const GempaEntity({
    required this.tanggal,
    required this.jam,
    required this.dateTime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        tanggal,
        jam,
        dateTime,
        coordinates,
        lintang,
        bujur,
        magnitude,
        kedalaman,
        wilayah,
        potensi
      ];
}
