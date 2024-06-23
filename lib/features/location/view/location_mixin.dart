import 'package:geolocator/geolocator.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';
import 'package:quietmasjid/features/location/view/location_view.dart';

import 'package:quietmasjid/product/state/base/base_state.dart';

mixin LocationViewMixin on BaseState<LocationView> {
  final LocationService locationService = const LocationService();
  Position? positionData;

  Future<Position?> determinePosition() async {
    positionData = await locationService.determinePosition();
    setState(() {
      positionData = positionData;
    });
    return positionData;
  }
}
