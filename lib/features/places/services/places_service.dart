import 'package:quietmasjid/features/location/model/location_special_model.dart';
import 'package:quietmasjid/features/places/model/place.dart';
import 'package:quietmasjid/product/env/prod_env.dart';
import 'package:quietmasjid/product/network/manager/product_network_manager.dart';
import 'package:quietmasjid/product/network/manager/product_network_path.dart';
import 'dart:math';

class PlacesService {
  final ProductNetworkManager _networkManager;

  PlacesService(this._networkManager);

/// Searches for nearby places based on the user's location and a specified radius.
///
/// This method sends a GET request to the `searchNearby` endpoint of the `ProductNetworkManager` with the user's location and a specified radius as query parameters.
/// The response from the server is then parsed into a `Place` object and returned.
///
/// [userLocation] The user's current location. This is an instance of `LocationSpecial` which contains the latitude and longitude of the user's location.
/// [radius] The radius within which to search for nearby places. This is specified in kilometers.
///
/// Returns a `Future` that completes with a `Place` object if the server returns a valid response. If the server returns an error, the `Future` completes with `null`.
Future<List<Result>?> searchNearby({LocationSpecial? userLocation, num? radius}) async {
  final response = await _networkManager
      .get<Place>(ProductNetworkPath.searchNearby.path, queryParameters: {
    "location": "${userLocation?.latitude},${userLocation?.longitude}",
    "radius": radius,
    "type": "mosque",
    "key": ProdEnv().apiKey,
  });
  final data = response.data;
  return data?.results;
}

  /// Calculates the Haversine distance between two points on the Earth's surface.
  ///
  /// The Haversine formula calculates the shortest distance between two points on the surface of a sphere.
  /// This method takes in the latitude and longitude of two points and returns the distance between them in kilometers.
  ///
  /// [lat1] Latitude of the first point.
  /// [lon1] Longitude of the first point.
  /// [lat2] Latitude of the second point.
  /// [lon2] Longitude of the second point.
  ///
  /// Returns the Haversine distance between the two points in kilometers.
  double haversine(num lat1, num lon1, num lat2, num lon2) {
    const double R = 6371.0; // Radius of the earth in km

    // Convert the difference in coordinates to radians
    num? differenceLat = _degreesToRadians(lat2 - lat1);
    num? differenceLon = _degreesToRadians(lon2 - lon1);

    // Apply the Haversine formula
    double? a = sin(differenceLat / 2.0) * sin(differenceLat / 2.0) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(differenceLon / 2) *
            sin(differenceLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Convert the result to kilometers and return
    return R * c;
  }

  num _degreesToRadians(num degrees) {
    return degrees * pi / 180.0;
  }
}
