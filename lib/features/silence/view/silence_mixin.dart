import 'package:flutter/material.dart';
import 'package:quietmasjid/features/silence/view/silence.dart';
import 'package:quietmasjid/features/silence/services/silence.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';
import 'package:flutter/services.dart';

mixin SilenceViewMixin on State<SilenceView> {
  MosqueSoundControlStrategy? _strategy;

  @override
  void initState() {
    super.initState();
    _strategy = NormalSoundControlStrategy(); // Initial strategy
    permissionCheckRequest(); // Check and request permission if necessary
  }

  void permissionCheckRequest() async {
    try {
      await MosqueSoundControl().checkPermission();
    } on PlatformException catch (e) {
      // Handle exception
      print('Failed to check permission: ${e.message}');
    }
  }

  Future<void> setSilenceMode(MosqueSoundControlStrategy strategy) async {
    try {
      setState(() {
        _strategy = strategy;
        MosqueSoundControl().setStrategy(strategy); // Update singleton strategy
      });

      await MosqueSoundControl().adjustSound(RingerModeStatus.silent);
    } on PlatformException catch (e) {
      // Handle exception
      print('Failed to set silence mode: ${e.message}');
    }
  }

  // You can optionally expose a getter for the current strategy
  MosqueSoundControlStrategy? get currentStrategy => _strategy;
}
