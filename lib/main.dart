import 'package:flutter/material.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:quietmasjid/features/app/service/mainapp_service.dart';
import 'package:quietmasjid/features/app/view/app.dart';

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
  MainAppService myappService = MainAppService();
  // Do your work here...
  await myappService.checkProximityToMosque();
  BackgroundFetch.finish(taskId);
}

void main() {
  runApp(const MainApp());

  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}
