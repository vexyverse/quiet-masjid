import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';
import 'package:quietmasjid/features/location/view/location_view.dart';
import 'package:quietmasjid/product/cache/model/location_cache_model.dart';
import 'package:quietmasjid/product/state/base/base_state.dart';

mixin LocationViewMixin on BaseState<LocationView> {
  final LocationService locationService = LocationService(
      userLocationCacheOperation: HiveCacheOperation<LocationCacheModel>());
  Position? positionData;

  Future<Position?> determinePostion() async {
    positionData = await locationService.determinePosition();
    setState(() {
      positionData = positionData;
    });
    return positionData;
  }
}
