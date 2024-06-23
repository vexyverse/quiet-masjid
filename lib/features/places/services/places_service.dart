import 'package:quietmasjid/features/location/model/location_special_model.dart';
import 'package:quietmasjid/features/places/model/place.dart';
import 'package:quietmasjid/product/env/prod_env.dart';
import 'package:quietmasjid/product/network/manager/product_network_manager.dart';
import 'package:quietmasjid/product/network/manager/product_network_path.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

class PlacesService {
  final ProductNetworkManager _networkManager;

  PlacesService(this._networkManager);

  Future<String?> searchNearby({LocationSpecial? userLocation, num? radius}) async {
    final response = await _networkManager
        .get<Place>(ProductNetworkPath.searchNearby.path, queryParameters: {
      "location": "${userLocation?.latitude},${userLocation?.longitude}",
      "radius": radius,
      "type": "mosque",
      "key": ProdEnv().apiKey,
    });
    final data = response.data;
    double? result;
    if (data != null) {
      final places = data.results;
      for (int i = 0; i < places!.length; i++) {
        var place = places[i];
        final lat1 = place.geometry?.location?.lat;
        final lon2 = place.geometry?.location?.lng;
         result = haversine(
            num.parse(userLocation!.latitude.toString()),
            num.parse(userLocation.longitude.toString()),
            num.parse(lat1.toString()),
            num.parse(lon2.toString()));
      }
    }
    return result?.toStringAsFixed(2);
  }

  double? haversine(num lat1, num lon1, num lat2, num lon2) {
    const double? R = 6371.0; // Radius of the earth in km

    num? dlat = _degreesToRadians(lat2 - lat1);
    num? dlon = _degreesToRadians(lon2 - lon1);
    double? a = sin(dlat / 2.0) * sin(dlat / 2.0) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dlon / 2) *
            sin(dlon / 2);

    double? c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  num _degreesToRadians(num degrees) {
    return degrees * pi / 180.0;
  }
}
