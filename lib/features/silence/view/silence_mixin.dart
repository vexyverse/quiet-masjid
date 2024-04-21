import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quietmasjid/features/silence/view/silence.dart';
import 'package:quietmasjid/features/silence/services/silence.dart';
import 'package:sound_mode/permission_handler.dart';
import 'package:sound_mode/sound_mode.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';

mixin SilenceViewMixin on State<SilenceView> {
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
