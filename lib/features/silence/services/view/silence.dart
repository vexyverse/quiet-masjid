import "package:flutter/material.dart";

//test for silence mod
class SilenceView extends StatelessWidget {
  const SilenceView({super.key});

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
                onPressed: () {}, child: const Text('Silence mode change')),
          ],
        ),
      ),
    );
  }
}
