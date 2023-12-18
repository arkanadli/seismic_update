// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gempa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GempaModel _$GempaModelFromJson(Map<String, dynamic> json) => GempaModel(
      tanggal: json['tanggal'] as String,
      jam: json['jam'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      coordinates: json['coordinates'] as String,
      lintang: json['lintang'] as String,
      bujur: json['bujur'] as String,
      magnitude: json['magnitude'] as String,
      kedalaman: json['kedalaman'] as String,
      wilayah: json['wilayah'] as String,
      potensi: json['potensi'] as String,
    );

Map<String, dynamic> _$GempaModelToJson(GempaModel instance) =>
    <String, dynamic>{
      'tanggal': instance.tanggal,
      'jam': instance.jam,
      'dateTime': instance.dateTime.toIso8601String(),
      'coordinates': instance.coordinates,
      'lintang': instance.lintang,
      'bujur': instance.bujur,
      'magnitude': instance.magnitude,
      'kedalaman': instance.kedalaman,
      'wilayah': instance.wilayah,
      'potensi': instance.potensi,
    };
