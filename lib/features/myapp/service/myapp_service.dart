import 'package:geolocator/geolocator.dart';
import 'package:kartal/kartal.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';
import 'package:quietmasjid/features/places/services/places_service.dart';

import '../../../product/state/container/product_state_items.dart';
import '../../location/model/location_special_model.dart';
import '../../silence/services/silence.dart';

class MyAppService {
  final double proximityThreshold = 0.270; // Kilometre cinsinden
  Future<void> checkProximityToMosque() async {
    const LocationService locationService = LocationService();
    final Position position = await locationService.determinePosition();

    final PlacesService placesService =
    PlacesService(ProductStateItems.productNetworkManager);
    final mosques = await placesService.searchNearby(
      userLocation: LocationSpecial(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
      radius: proximityThreshold * 1000, // Metre cinsinden çevrildi
    );

    if (mosques?.ext.isNotNullOrEmpty == true) {
      var nearestMosque = mosques?[0];
      double distance = placesService.haversine(
        position.latitude,
        position.longitude,
        nearestMosque?.geometry!.location!.lat as num,
        nearestMosque?.geometry!.location!.lng as num,
      );

      print('En yakın camiiye olan mesafe: ${distance.toStringAsFixed(2)} km');

      if (distance <= proximityThreshold) {
        print('Camiiye yakınsınız.');
        MosqueSoundControl().setStrategy(InMosqueSoundControlStrategy());
      } else {
        print('Camiiye yakın değilsiniz.');
        MosqueSoundControl().setStrategy(NormalSoundControlStrategy());
      }
    } else {
      print('Yakında camii bulunamadı.');
      MosqueSoundControl().setStrategy(NormalSoundControlStrategy());
    }
  }
}