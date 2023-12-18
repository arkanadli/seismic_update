import 'package:json_annotation/json_annotation.dart';
import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';

part 'kontak_model.g.dart';

@JsonSerializable()
class KontakModel extends KontakEntity {
  const KontakModel({
    required super.id,
    required super.nama,
    required super.nomorHp,
    required super.keterangan,
  });

  KontakModel copyWith({
    String? id,
    String? nama,
    String? nomorHp,
    String? keterangan,
  }) {
    return KontakModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      nomorHp: nomorHp ?? this.nomorHp,
      keterangan: keterangan ?? this.keterangan,
    );
  }

  KontakEntity toEntity() {
    return KontakEntity(
      id: id,
      nama: nama,
      nomorHp: nomorHp,
      keterangan: keterangan,
    );
  }

  factory KontakModel.fromEntity(KontakEntity entity) {
    return KontakModel(
      id: entity.id,
      nama: entity.nama,
      nomorHp: entity.nomorHp,
      keterangan: entity.keterangan,
    );
  }

  factory KontakModel.fromJson(Map<String, dynamic> json) {
    return _$KontakModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KontakModelToJson(this);
}
