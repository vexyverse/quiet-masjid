import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'location_special_model.g.dart';

@JsonSerializable()
class LocationSpecial  with EquatableMixin {
  final double? latitude;
  final double? longitude;
  final String? address;
  final DateTime? timestamp;
  final double? speed;

  LocationSpecial({
    this.latitude,
    this.longitude,
    this.address,
    this.timestamp,
    this.speed,
  });

  factory LocationSpecial.fromMap(Position latLng) {
    return LocationSpecial(
        latitude: latLng.latitude, longitude: latLng.longitude);
  }

  factory LocationSpecial.fromGpsData(Map<String, dynamic> gpsData) {
    final latitude = gpsData['latitude'] as double;
    final longitude = gpsData['longitude'] as double;
    return LocationSpecial(latitude: latitude, longitude: longitude);
  }
  factory LocationSpecial.fromJson(Map<String, dynamic> json) =>
      _$LocationSpecialFromJson(json);
  Map<String, dynamic> toJson() => _$LocationSpecialToJson(this);
  @override
  List<Object?> get props => [latitude, longitude, address, timestamp, speed];
}
