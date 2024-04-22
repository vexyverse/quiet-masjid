// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationCache _$LocationCacheFromJson(Map<String, dynamic> json) =>
    LocationCache(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      speed: (json['speed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationCacheToJson(LocationCache instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'timestamp': instance.timestamp?.toIso8601String(),
      'speed': instance.speed,
    };
