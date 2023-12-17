import 'package:json_annotation/json_annotation.dart';
import 'package:seismic_update/features/gempa/domain/entities/gempa_entity.dart';

part 'gempa_model.g.dart';

@JsonSerializable()
class GempaModel extends GempaEntity {
  const GempaModel({
    required super.tanggal,
    required super.jam,
    required super.dateTime,
    required super.coordinates,
    required super.lintang,
    required super.bujur,
    required super.magnitude,
    required super.kedalaman,
    required super.wilayah,
    required super.potensi,
  });

  factory GempaModel.fromJson(Map<String, dynamic> json) =>
      _$GempaModelFromJson(json);

  Map<String, dynamic> toJson() => _$GempaModelToJson(this);
}
