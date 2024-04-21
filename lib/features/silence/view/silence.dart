import "package:flutter/material.dart";
import "package:quiet_masjid/features/silence/services/silence.dart";
import "package:quiet_masjid/features/silence/view/silence_mixin.dart";

//test for silence mod
class SilenceView extends StatefulWidget {
  const SilenceView({super.key});

  @override
  State<SilenceView> createState() => _SilenceViewState();
}

class _SilenceViewState extends State<SilenceView> with SilenceViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Silence',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                permissionCheckRequest();
              },
              child: const Text('Request Permission'),
            ),
            ElevatedButton(
              onPressed: () async {
                setSilenceMode(InMosqueSoundControlStrategy());
              },
              child: const Text('Silence mode change'),
            ),
          ],
        ),
      ),
    );
  }
}
