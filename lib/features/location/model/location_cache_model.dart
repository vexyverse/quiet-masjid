import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:location/location.dart';
part 'location_cache_model.g.dart';

@JsonSerializable()
class LocationCache with EquatableMixin {
  final double? latitude;
  final double? longitude;
  final String? address;
  final DateTime? timestamp;
  final double? speed;

  LocationCache({
    this.latitude,
    this.longitude,
    this.address,
    this.timestamp,
    this.speed,
  });

  factory LocationCache.fromMap(LocationData latLng) {
    return LocationCache(
        latitude: latLng.latitude, longitude: latLng.longitude);
  }

  factory LocationCache.fromGpsData(Map<String, dynamic> gpsData) {
    final latitude = gpsData['latitude'] as double;
    final longitude = gpsData['longitude'] as double;
    return LocationCache(latitude: latitude, longitude: longitude);
  }
  factory LocationCache.fromJson(Map<String, dynamic> json) =>
      _$LocationCacheFromJson(json);
  Map<String, dynamic> toJson() => _$LocationCacheToJson(this);
  @override
  List<Object?> get props => [latitude, longitude, address, timestamp, speed];
}
