// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_special_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationSpecial _$LocationSpecialFromJson(Map<String, dynamic> json) =>
    LocationSpecial(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      speed: (json['speed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationSpecialToJson(LocationSpecial instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'timestamp': instance.timestamp?.toIso8601String(),
      'speed': instance.speed,
    };
