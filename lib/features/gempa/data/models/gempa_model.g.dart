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
      'Tanggal': instance.tanggal,
      'Jam': instance.jam,
      'DateTime': instance.dateTime.toIso8601String(),
      'Coordinates': instance.coordinates,
      'Lintang': instance.lintang,
      'Bujur': instance.bujur,
      'Magnitude': instance.magnitude,
      'Kedalaman': instance.kedalaman,
      'Wilayah': instance.wilayah,
      'Potensi': instance.potensi,
    };
