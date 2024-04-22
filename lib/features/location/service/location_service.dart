import 'package:core/core.dart';
import 'package:location/location.dart';
import 'package:quietmasjid/product/cache/model/location_cache_model.dart';
import 'package:quietmasjid/features/location/model/location_cache_model.dart';

final class LocationService {
  LocationService({required this.userCacheOperation});

  Future<LocationData> getLocation() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    return locationData;
  }

  final HiveCacheOperation<LocationCacheModel> userCacheOperation;
  //save location data
  Future<void> saveLocation(LocationData locationData) async {
    userCacheOperation.add(
        LocationCacheModel(locationCache: LocationCache.fromMap(locationData)));
  }
}
