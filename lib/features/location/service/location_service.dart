import 'package:core/core.dart';
import 'package:location/location.dart';
import 'package:quietmasjid/product/cache/model/location_cache_model.dart';
import 'package:quietmasjid/features/location/model/location_cache_model.dart';

/// A service that provides location-related functionality.
class LocationService {
  /// Creates a new instance of [LocationService].
  ///
  /// The [userLocationCacheOperation] parameter must not be null.
  LocationService({required this.userLocationCacheOperation});

  /// Returns the current location.
  Future<LocationData> readLocation() async {
    final Location location = Location();
    final LocationData locationData = await location.getLocation();
    return locationData;
  }

  /// Saves the given [locationData] to the user's location cache.
  Future<void> saveLocation(LocationData locationData) async {
    userLocationCacheOperation.add(
      LocationCacheModel(locationCache: LocationCache.fromMap(locationData)),
    );
  }

  Future<LocationCache?> readHiveFromCache() async {
    final LocationCacheModel? locationCacheModel =
        userLocationCacheOperation.get('cami');
    return locationCacheModel?.locationCache;
  }

  /// The cache operation for the user's location.
  final HiveCacheOperation<LocationCacheModel> userLocationCacheOperation;
}
