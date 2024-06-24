import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:quietmasjid/features/location/service/location_service.dart';
import 'package:quietmasjid/features/myapp/service/myapp_service.dart';
import 'package:quietmasjid/features/myapp/view/myapp.dart';
import 'package:quietmasjid/features/places/services/places_service.dart';
import 'package:quietmasjid/features/silence/services/silence.dart';
import 'package:quietmasjid/features/location/model/location_special_model.dart';
import 'package:quietmasjid/features/splash/view/splash_view.dart';
import 'package:quietmasjid/product/state/container/product_state_items.dart';
import 'package:kartal/kartal.dart';


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
  MyAppService myappService = MyAppService();
  // Do your work here...
  await myappService.checkProximityToMosque();
  BackgroundFetch.finish(taskId);
}



void main() {
  runApp(MyApp());

  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}