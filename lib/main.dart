import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';
import 'package:quietmasjid/features/places/services/places_service.dart';
import 'package:quietmasjid/features/splash/view/splash_view.dart';
import 'package:quietmasjid/product/init/config/app_environment.dart';
import 'package:quietmasjid/product/state/container/product_state_container.dart';
import 'package:quietmasjid/product/state/container/product_state_items.dart';
import 'package:background_fetch/background_fetch.dart';

import 'features/location/model/location_special_model.dart';

// [Android-only] This "Headless Task" is run when the Android app is terminated with `enableHeadless: true`
// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');
  const LocationService locationService = LocationService();
  final Position position = await locationService.determinePosition();

  final PlacesService placesService = PlacesService(ProductStateItems.productNetworkManager);
  final result = await placesService.searchNearby(
    userLocation: LocationSpecial(
      latitude: position.latitude,
      longitude: position.longitude,
    ),
    radius: 270,
  );
  print("camii mesafesi $result");
  BackgroundFetch.finish(taskId);
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.general();
  ProductContainer.setup();
  await ProductStateItems.productCache.init();
  runApp(const MyApp());
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(body: SplashScreen()),
    );
  }
}
