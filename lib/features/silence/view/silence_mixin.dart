import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:quietmasjid/features/silence/view/silence.dart';
import 'package:quietmasjid/features/silence/services/silence.dart';
import 'package:sound_mode/permission_handler.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';

mixin SilenceViewMixin on State<SilenceView> {
  final bool _enabled = true;
  int _status = 0;
  final List<DateTime> _events = [];
  MosqueSoundControlStrategy? _strategy;

  @override
  void initState() {
    super.initState();
    _strategy = NormalSoundControlStrategy(); // Initial strategy
  }

  void permissionCheckRequest() async {
    bool? isGranted = await PermissionHandler.permissionsGranted;

    if (isGranted != null && !isGranted) {
      // Opens the Do Not Disturb Access settings to grant the access
      await PermissionHandler.openDoNotDisturbSetting();
    }
  }
  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE
    ), (String taskId) async {  // <-- Event handler
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      setState(() {
        _events.insert(0, new DateTime.now());
      });
      // IMPORTANT:  You must signal completion of your task or the OS can punish your app
      // for taking too long in the background.
      BackgroundFetch.finish(taskId);
    }, (String taskId) async {  // <-- Task timeout handler.
      // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
      print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
      BackgroundFetch.finish(taskId);
    });
    print('[BackgroundFetch] configure success: $status');
    setState(() {
      _status = status;
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }
  Future<void> setSilenceMode(MosqueSoundControlStrategy strategy) async {
    setState(() {
      _strategy = strategy;
      MosqueSoundControl().setStrategy(strategy); // Update singleton strategy
      MosqueSoundControl().adjustSound(RingerModeStatus.silent);
    });
  }

  // You can optionally expose a getter for the current strategy
  MosqueSoundControlStrategy? get currentStrategy => _strategy;
}
