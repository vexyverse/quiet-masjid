import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart'; // Import the permission_handler package
import 'package:sound_mode/utils/ringer_mode_statuses.dart';

class MosqueSoundControl {
  static final MosqueSoundControl _instance = MosqueSoundControl._internal();
  MosqueSoundControlStrategy? _strategy;

  factory MosqueSoundControl() {
    return _instance;
  }

  MosqueSoundControl._internal();

  void setStrategy(MosqueSoundControlStrategy strategy) {
    _strategy = strategy;
  }

  Future<void> adjustSound(RingerModeStatus mode) async {
    try {
      if (_strategy != null) {
        await _strategy!.adjustSound(mode);
      }
    } on PlatformException catch (e) {
      _log('Failed to adjust sound: ${e.message}');
    }
  }

  Future<void> checkPermission() async {
    try {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
      if (await Permission.notification.isGranted) {
        print('Permission granted.');
      } else {
        await Permission.notification.request();
      }
    } on PlatformException catch (e) {
      _log('Failed to check permission: ${e.message}');
    }
  }

  void _log(String message) {
    // Implement a logging framework or method here
    print(message); // Replace this with a logging framework
  }
}

abstract class MosqueSoundControlStrategy {
  Future<void> adjustSound(RingerModeStatus mode);
}

class NormalSoundControlStrategy implements MosqueSoundControlStrategy {
  @override
  Future<void> adjustSound(RingerModeStatus mode) async {
    // Implement the logic for adjusting to normal sound mode
  }
}
