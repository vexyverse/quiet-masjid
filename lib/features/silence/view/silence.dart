import "package:flutter/material.dart";
import "package:quietmasjid/features/silence/services/silence.dart";
import "package:quietmasjid/features/silence/view/silence_mixin.dart";

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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pictures/wallpaper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Silence',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                    MosqueSoundControlStrategy strategy =
                        NormalSoundControlStrategy();
                    await setSilenceMode(strategy);
                  },
                  child: const Text('Silence mode change'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
