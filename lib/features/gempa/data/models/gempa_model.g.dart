// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gempa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GempaModel _$GempaModelFromJson(Map<String, dynamic> json) => GempaModel(
      tanggal: json['Tanggal'] as String,
      jam: json['Jam'] as String,
      dateTime: DateTime.parse(json['DateTime'] as String),
      coordinates: json['Coordinates'] as String,
      lintang: json['Lintang'] as String,
      bujur: json['Bujur'] as String,
      magnitude: json['Magnitude'] as String,
      kedalaman: json['Kedalaman'] as String,
      wilayah: json['Wilayah'] as String,
      potensi: json['Potensi'] as String,
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
