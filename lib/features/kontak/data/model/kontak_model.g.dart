// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kontak_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KontakModel _$KontakModelFromJson(Map<String, dynamic> json) => KontakModel(
      id: json['id'] as String,
      nama: json['nama'] as String,
      nomorHp: json['nomorHp'] as String,
      keterangan: json['keterangan'] as String,
    );

Map<String, dynamic> _$KontakModelToJson(KontakModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'nomorHp': instance.nomorHp,
      'keterangan': instance.keterangan,
    };
