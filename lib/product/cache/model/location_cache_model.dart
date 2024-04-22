import 'package:core/core.dart';
import 'package:quietmasjid/features/location/model/location_cache_model.dart';

//hive cache manager'a cache edilecek model

final class LocationCacheModel with CacheModel {
  LocationCacheModel({this.locationCache});
  final LocationCache? locationCache;
  @override
  CacheModel fromDynamicJson(dynamic json) {
    return LocationCacheModel(locationCache: LocationCache.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson() {
    return locationCache?.toJson();
  }

  LocationCacheModel copyWith({LocationCache? locationCache}) {
    return LocationCacheModel(
      locationCache: locationCache ?? this.locationCache,
    );
  }

  @override
  String get id => "cami";
}
